import 'dart:io';

import 'package:onix_flutter_bricks/app/extension/logger_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/string_extensions.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/component_generator/file_operation_result.dart';
import 'package:onix_flutter_bricks/domain/service/component_generator/params/component_generator_params.dart';
import 'package:recase/recase.dart';

mixin FileMixin on BaseGenerationService<String, ComponentGeneratorParams> {
  Future<FileOperationResult> createFile({
    required String filePath,
    required String fileBody,
    bool overwrite = false,
  }) async {
    final file = File(filePath);

    try {
      final isAlreadyExist = file.existsSync();
      if (isAlreadyExist) {
        logger.i('File already exists: $filePath');
        if (!overwrite) {
          return FileOperationResult.alreadyExists;
        }
      } else {
        await file.create(recursive: true);
      }
      await file.writeAsString(fileBody);
      logger.i('File created: $filePath');
      return FileOperationResult.created;
    } catch (e) {
      logger.crash(error: e, stackTrace: StackTrace.current);
      return FileOperationResult.error;
    }
  }

  Future<void> modifyFile({
    required String filePath,
    required String body,
    required SourceComponent sourceComponent,
    required DataType dataType,
  }) async {
    final codeLines = <String>[];

    final bodyLines = body.split('\n');

    final existingContent = File(filePath).readAsStringSync();

    final newRequests = <RequestComponent>[];

    for (final request in sourceComponent.requests) {
      if (!existingContent.contains(request.operationId.camelCase)) {
        newRequests.add(request);
      }
    }

    if (newRequests.isEmpty) {
      return;
    }

    final newImports = <String>[];

    for (final line in bodyLines) {
      if (line.trim().startsWith("import 'package:")) {
        newImports.add(line);
      }
    }

    final newEndpoints = dataType == DataType.sourceImpl
        ? sourceComponent.requests
            .map((request) => request.getVariableDeclaration())
            .toList()
        : <String>[];

    final newMappers = <String>[];

    for (final line in bodyLines) {
      if (line.trim().endsWith('Mappers();')) {
        newMappers.add(line);
      }
    }

    for (final request in newRequests) {
      codeLines.add(
        switch (dataType) {
          DataType.repo => request.getRepoDeclarationBody(),
          DataType.repoImpl =>
            request.getRepoImplementationBody(sourceComponent.name.camelCase),
          DataType.source => request.getRequestDeclaration(),
          DataType.sourceImpl => request.getRequestBody(),
        },
      );
    }

    final newContent = codeLines.join('\n\n');

    await _buildFile(
      filePath: filePath,
      fileBody: newContent,
      newImports: newImports,
      newEndpoints: newEndpoints,
      newMappers: newMappers,
    );
  }

  Future<bool> _buildFile({
    required String filePath,
    required String fileBody,
    List<String> newImports = const [],
    List<String> newEndpoints = const [],
    List<String> newMappers = const [],
  }) async {
    final file = File(filePath);

    try {
      final existingContent = await file.readAsString()
        ..trim();

      final rawContentLines = existingContent.split(';').toList();

      bool classLineCondition(String line) =>
          line.trim().startsWith('class') &&
          line.contains('SourceImpl implements');

      final classLineIndex = rawContentLines.indexWhere(classLineCondition);

      final splitClassLines = <String>[];

      final existingContentLines = rawContentLines.map(
        (line) {
          final result =
              '${line.trim()}${line == rawContentLines.last ? '' : ';'}';

          if (classLineCondition(result) &&
              (result.contains('static const _') ||
                  result.contains('String _'))) {
            splitClassLines.addAll(result.split('\n'));
          }

          return result;
        },
      ).toList();

      if (splitClassLines.isNotEmpty) {
        existingContentLines
          ..removeAt(classLineIndex)
          ..insertAll(classLineIndex, splitClassLines);
      }

      //Conditions for identifying lines
      bool importCondition(String line) => line.startsWith("import 'package:");

      bool endpointCondition(String line) =>
          line.trim().startsWith('static const _');

      bool pathEndpointCondition(String line) =>
          line.trim().startsWith('String _') &&
          line.contains(r'/$') &&
          line.contains('=>');

      //Combine imports
      if (newImports.isNotEmpty) {
        final existingImports = existingContentLines
            .where(importCondition)
            .toSet()
          ..addAll(newImports);

        existingContentLines
          ..removeWhere(importCondition)
          ..insert(0, existingImports.toSet().join('\n'));
      }

      final afterClassIndex = existingContentLines.indexWhere(
            (line) =>
                line.trim().startsWith('class') &&
                line.contains('implements') &&
                line.contains('{'),
          ) +
          1;

      //Combine endpoints
      if (newEndpoints.isNotEmpty) {
        final firstEndpointIndex =
            existingContentLines.indexWhere(endpointCondition);

        final existingEndpoints = existingContentLines
            .where(endpointCondition)
            .map((line) => line.trim().replaceAll('\n', '').clearSpaces())
            .toList()
          ..addAll(
            existingContentLines
                .where(pathEndpointCondition)
                .map((line) => line.trim().replaceAll('\n', '').clearSpaces()),
          )
          ..addAll(newEndpoints)
          ..add('\n');

        existingContentLines
          ..removeWhere(endpointCondition)
          ..removeWhere(pathEndpointCondition)
          ..insert(
            firstEndpointIndex > 0 ? firstEndpointIndex : afterClassIndex,
            existingEndpoints.toSet().join('\n'),
          );
      }

      //Combine mappers
      if (newMappers.isNotEmpty) {
        bool condition(String line) => line.endsWith('Mappers();');
        final mapperIndex = existingContentLines.indexWhere(condition);

        final existingMappers = existingContentLines
            .where(condition)
            .map((line) => line.trim())
            .toSet()
          ..addAll(newMappers)
          ..add('\n');

        existingContentLines
          ..removeWhere(condition)
          ..insert(
            mapperIndex > 0 ? mapperIndex : afterClassIndex,
            existingMappers.toSet().join('\n'),
          );

        logger.f(
          'Mappers added: ${existingMappers.toSet().join('\n')}',
        );
      }

      final closingBracketIndex = existingContentLines.lastIndexWhere(
        (line) => line.trim().contains('}'),
      );

      final closingBracketLineParts =
          existingContentLines[closingBracketIndex].split('');

      closingBracketLineParts.insert(
        closingBracketLineParts.lastIndexWhere((line) => line == '}'),
        fileBody,
      );

      existingContentLines[closingBracketIndex] =
          closingBracketLineParts.join();

      final resultFileBody = existingContentLines.join('\n');

      await file.writeAsString(resultFileBody);
      logger.i('File updated: $filePath');

      return true;
    } catch (e) {
      logger.crash(error: e, stackTrace: StackTrace.current);
      return false;
    }
  }

  Future<void> createFolders(
    String path,
    String methodCaller,
  ) async {
    try {
      final directory = Directory(path);
      if (directory.existsSync()) {
        logger.i('$methodCaller. Directory already exists: $path');
      } else {
        await directory.create(recursive: true);
        logger.i('$methodCaller. Directory created: $path');
      }
    } catch (e) {
      logger.crash(error: e, stackTrace: StackTrace.current);
    }
  }
}

enum DataType {
  repo,
  repoImpl,
  source,
  sourceImpl,
}
