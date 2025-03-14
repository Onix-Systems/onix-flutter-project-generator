import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/enum/dart_types.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/core/di/source.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/json_parser_failure.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/params/flavor_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/params/signing_generator_params.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_flavors_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_signing_config_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/clear_output_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/get_generation_output_stream_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/get_signing_fingerprint_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/screen/clear_screens_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/empty_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/bloc/procedure_selection_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/commands.dart';
import 'package:onix_flutter_bricks/util/extension/project_config_extension.dart';
import 'package:recase/recase.dart';

class ProcedureSelectionScreenBloc extends BaseBloc<
    ProcedureSelectionScreenEvent,
    ProcedureSelectionScreenState,
    ProcedureSelectionScreenSR> {
  final GenerateSigningConfigUseCase _generateSigningConfigUseCase;
  final GenerateFlavorsUseCase _generateFlavorsUseCase;
  final GetSigningFingerprintUseCase _getSigningFingerprintUseCase;
  final ClearSwaggerComponentsUseCase _clearSwaggerComponentsUseCase;
  final ClearScreensUseCase _clearScreensUseCase;
  final GetGenerationOutputStream _getGenerationOutputStream;
  final ClearOutputUseCase _clearOutputUseCase;
  final RunProcessUseCase _runProcessUseCase;

  String tabs([int count = 1]) => '  ' * count;

  ProcedureSelectionScreenBloc(
    this._generateSigningConfigUseCase,
    this._generateFlavorsUseCase,
    this._getSigningFingerprintUseCase,
    this._clearSwaggerComponentsUseCase,
    this._clearScreensUseCase,
    this._getGenerationOutputStream,
    this._clearOutputUseCase,
    this._runProcessUseCase,
  ) : super(const ProcedureSelectionScreenStateData(config: Config())) {
    on<ProcedureSelectionScreenEventInit>(_onInit);
    on<ProcedureSelectionScreenEventOnProjectOpen>(_onProjectOpen);
    on<ProcedureSelectionScreenEventOnNewProject>(_onNewProject);
    on<ProcedureSelectionScreenEventOnLocaleChange>(_onLocaleChange);
    on<ProcedureSelectionScreenEventOnAndroidSigning>(_onAndroidSigning);
    on<ProcedureSelectionScreenEventOnGenerateFlavors>(_onGenerateFlavors);
    on<ProcedureSelectionScreenEventOpenProjectInStudio>(_openProjectInStudio);
    on<ProcedureSelectionScreenEventOnFlavorizrOutputClose>(
      _onFlavorizrOutputClosed,
    );
  }

  Future<void> _onInit(
    ProcedureSelectionScreenEventInit event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        config: Config.empty().copyWith(
          branchConfig: event.branchConfig,
        ),
        language: Intl.getCurrentLocale(),
      ),
    );
  }

  Future<void> _onNewProject(
    ProcedureSelectionScreenEventOnNewProject event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    _clearScreensUseCase();
    _clearSwaggerComponentsUseCase(empty: true);

    emit(
      state.copyWith(
        config: Config(
          projectPath: event.projectPath,
          branchConfig: state.config.branchConfig,
        ),
      ),
    );

    addSr(const ProcedureSelectionScreenSR.onNewProject());
  }

  Future<void> _onProjectOpen(
    ProcedureSelectionScreenEventOnProjectOpen event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    final config = await configSource.getConfig(
      configPath: '${event.projectURI}/.gen_config.json',
    );

    if (config == Config.empty()) {
      addSr(const ProcedureSelectionScreenSR.emptyConfig());
      return;
    }

    final projectName = event.projectURI.split('/').last;
    final projectPath = event.projectURI.replaceAll('/$projectName', '');

    screenRepository
      ..empty()
      ..addAll(screens: config.screens);

    _clearSwaggerComponentsUseCase(empty: true);

    emit(
      state.copyWith(
        config: config.copyWith(
          projectName: projectName,
          projectPath: projectPath,
          projectExists: true,
          branchConfig: state.config.branchConfig,
        ),
      ),
    );

    addSr(const ProcedureSelectionScreenSR.loadFinished());
  }

  Future<void> _onLocaleChange(
    ProcedureSelectionScreenEventOnLocaleChange event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    await S.load(Locale(event.language));

    emit(
      state.copyWith(
        language: event.language,
      ),
    );
  }

  Future<bool> checkIsSigningExists({required String projectFolder}) async {
    final workDirectory = '$projectFolder/android/app/signing';

    final certificateFile = File('$workDirectory/upload-keystore.jks');
    final certificateExist = certificateFile.existsSync();

    if (certificateExist) {
      return true;
    }

    final buildGradle = File('$projectFolder/android/app/build.gradle');
    final buildGradleContent = await buildGradle.readAsString();

    final signingConfigExists = buildGradleContent.contains('''
signingConfigs {
        signed
      }''');

    if (signingConfigExists) {
      return true;
    }

    return false;
  }

  FutureOr<void> _onAndroidSigning(
    ProcedureSelectionScreenEventOnAndroidSigning event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    showProgress();

    final signingPassword = state.config.getSigningPassword(
      ignoreSetting: true,
    );

    final result = await _generateSigningConfigUseCase(
      params: SingingGeneratorParams(
        projectFolder: event.directory.path,
        signingVars: event.signingVars,
        signingPassword: signingPassword,
        separateFromBrick: true,
        overwrite: event.overwrite,
      ),
    );
    await hideProgress();
    if (result.success) {
      final fingerprints = await _getSigningFingerprintUseCase(
        projectFolder: event.directory.path,
        password: signingPassword,
      );
      addSr(
        ProcedureSelectionScreenSR.onAndroidSigningCreated(
          fingerprints: fingerprints,
        ),
      );
    } else {
      onFailure(result.error.failure);
      return;
    }
  }

  Future<void> _onGenerateFlavors(
    ProcedureSelectionScreenEventOnGenerateFlavors event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    final outputStream = await _getGenerationOutputStream();

    emit(
      state.copyWith(
        flavorizingDirectory: event.directory,
        flavorizrOutputVisible: true,
        isGenerating: true,
        outputStream: outputStream,
      ),
    );

    final result = await _generateFlavorsUseCase(
      params: FlavorGeneratorParams(
        projectFolder: event.directory.path,
        flavors: event.flavors.toList(),
        separateFromBrick: true,
      ),
    );

    if (result.isError) {
      onFailure(result.error.failure);
    }

    emit(
      state.copyWith(
        isGenerating: false,
      ),
    );
  }

  Future<void> _openProjectInStudio(
    ProcedureSelectionScreenEventOpenProjectInStudio event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    final flavorizingDirectory = state.flavorizingDirectory;

    if (flavorizingDirectory == null) {
      return;
    }

    unawaited(
      _runProcessUseCase(
        workDir: flavorizingDirectory.path,
        commands: [Commands.getOpenAndroidStudioCommand()],
      ),
    );

    add(const ProcedureSelectionScreenEventOnFlavorizrOutputClose());
  }

  Future<void> _onFlavorizrOutputClosed(
    ProcedureSelectionScreenEventOnFlavorizrOutputClose event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    _clearOutputUseCase();

    emit(
      state.copyWith(
        flavorizrOutputVisible: false,
        flavorizingDirectory: null,
        isGenerating: false,
        outputStream: null,
      ),
    );
  }

  String generateClassesFromJson({required String json, String? name}) {
    try {
      final parsed = jsonDecode(json) as Map<String, dynamic>;

      final fields = <DataVariableComponent>[];

      final classes = <String>{};

      for (final key in parsed.keys) {
        final value = parsed[key];
        var valueType = value.runtimeType.toString();

        if (value is Map<String, dynamic>) {
          valueType = key.pascalCase;
          final newClass = generateClassesFromJson(
            json: jsonEncode(value),
            name: valueType,
          );

          classes.add(newClass);
        } else if (value is List) {
          if (value.first is Map<String, dynamic>) {
            valueType = key.pascalCase;
            final newClass = generateClassesFromJson(
              json: jsonEncode(value.first),
              name: valueType,
            );

            classes.add(newClass);
          } else {
            valueType = value.first.runtimeType.toString();
          }
        }

        fields.add(
          _createVariable(
            valueType,
            key,
            false,
            value is List,
          ),
        );
      }

      final result = [
        'class ${name ?? 'GeneratedClass'} {',
        ...fields.map((e) => '${tabs()}final ${e.type} ${e.name};'),
        '\n${tabs()}${'${name ?? 'GeneratedClass'} ({'}',
        ...fields.map((e) => '${tabs(2)}required this.${e.name},'),
        '${tabs()}});',
        _generateToJson(fields),
        _generateFromJson(fields, name ?? 'GeneratedClass'),
        '}\n',
        ...classes,
      ];

      return result.join('\n');
    } catch (e) {
      onFailure(JsonParserFailure(e: e as Exception));
      return '';
    }
  }

  DataVariableComponent _createVariable(
    String type,
    String name,
    bool isRequired,
    bool isList,
  ) {
    final variableType = DartTypes.types.contains(type)
        ? SwaggerVariable(DartTypes.toSwaggerType(type))
        : SwaggerReference(type);

    final component = DataVariableComponent(
      name: name.camelCase,
      type: variableType,
      isRequired: isRequired,
    );

    final variable = isList
        ? DataVariableComponent(
            name: name.camelCase,
            type: SwaggerArray(
              SwaggerModelVariableResponseV3(
                name: name.camelCase,
                type: variableType,
                isRequired: isRequired,
              ),
            ),
            isRequired: isRequired,
          )
        : component;
    return variable;
  }

  String _generateToJson(List<DataVariableComponent> variables) {
    final result = <String>['\n${tabs()}Map<String, dynamic> toJson() => {'];

    for (final variable in variables) {
      if (variable.type is SwaggerVariable) {
        result.add(
          "${tabs(2)}'${variable.name}': ${variable.name},",
        );
      } else if (variable.type is SwaggerReference) {
        result.add(
          "${tabs(2)}'${variable.name}': ${variable.name}.toJson(),",
        );
      } else if (variable.type is SwaggerArray) {
        final itemType = (variable.type as SwaggerArray).itemType.type;

        if (itemType is SwaggerVariable) {
          result.add(
            "${tabs(2)}'${variable.name}': ${variable.name},",
          );
        } else if (itemType is SwaggerReference) {
          result.add(
            "${tabs(2)}'${variable.name}': ${variable.name}.map((e) => e.toJson()).toList(),",
          );
        }
      }
    }

    result.add('${tabs()}};');

    return result.join('\n');
  }

  String _generateFromJson(List<DataVariableComponent> variables, String name) {
    final result = <String>[
      '\n${tabs()}factory $name.fromJson(Map<String, dynamic> json) => $name(',
    ];

    for (final variable in variables) {
      if (variable.type is SwaggerVariable) {
        final type = (variable.type as SwaggerVariable).type;

        result.add(
          "${tabs(2)}${variable.name}: json['${variable.name}'] as ${type.toSwaggerDartType()},",
        );
      } else if (variable.type is SwaggerReference) {
        final reference = variable.type as SwaggerReference;
        result.add(
          "${tabs(2)}${variable.name}: $reference.fromJson(json['${variable.name}'] as Map<String, dynamic>),",
        );
      } else if (variable.type is SwaggerArray) {
        final itemType = (variable.type as SwaggerArray).itemType.type;

        if (itemType is SwaggerVariable) {
          result.add(
            "${tabs(2)}${variable.name}: json['${variable.name}'] as List<${itemType.type.toSwaggerDartType()}>,",
          );
        } else if (itemType is SwaggerReference) {
          result.add(
            "${tabs(2)}${variable.name}: (json['${variable.name}'] as List<Map<String, dynamic>>).map($itemType.fromJson).toList(),",
          );
        }
      }
    }

    result.add('${tabs()});');

    return result.join('\n');
  }
}
