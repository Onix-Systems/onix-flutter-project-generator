import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/swagger_parser/swagger_data.dart';
import 'package:onix_flutter_bricks/util/swagger_parser/swagger_parser.dart';
import 'package:recase/recase.dart';

class SwaggerParserScreenBloc extends BaseBloc<SwaggerParserScreenEvent,
    SwaggerParserScreenState, SwaggerParserScreenSR> {
  SwaggerParserScreenBloc()
      : super(
          SwaggerParserScreenStateData(
            config: const Config(),
            parsedData: SwaggerData.empty(),
          ),
        ) {
    on<SwaggerParserScreenEventInit>(_onInit);
    on<SwaggerParserScreenEventOnUrlChanged>(_onUrlChanged);
    on<SwaggerParserScreenEventParse>(_onParse);
    on<SwaggerParserScreenEventOnReplace>(_onReplace);
  }

  FutureOr<void> _onInit(
    SwaggerParserScreenEventInit event,
    Emitter<SwaggerParserScreenState> emit,
  ) {
    emit(state.copyWith(
      config: event.config,
    ));
  }

  FutureOr<void> _onUrlChanged(
    SwaggerParserScreenEventOnUrlChanged event,
    Emitter<SwaggerParserScreenState> emit,
  ) {
    emit(state.copyWith(
      config: state.config.copyWith(
        swaggerUrl: event.url,
      ),
    ));
  }

  FutureOr<void> _onParse(
    SwaggerParserScreenEventParse event,
    Emitter<SwaggerParserScreenState> emit,
  ) async {
    showProgress();
    try {
      var response = await http.get(Uri.parse(event.url));

      var json = jsonDecode(response.body);

      final parsedData = SwaggerParser.parse(
          data: json as Map<String, dynamic>,
          projectName: state.config.projectName);

      final stateComponents =
          Set<DataComponent>.from(state.config.dataComponents);

      for (var dataComponent in parsedData.dataComponents) {
        if (stateComponents
            .where((element) =>
                element.name.pascalCase == dataComponent.name.pascalCase)
            .isEmpty) {
          stateComponents.add(dataComponent);
        }
      }

      for (final dataComponent in stateComponents) {
        if (dataComponent.isGenerated) {
          parsedData.dataComponents.removeWhere((element) =>
              element.name.pascalCase == dataComponent.name.pascalCase);
        }
      }

      final stateSources = Set<Source>.from(state.config.sources);

      for (var parsedSource in parsedData.sources) {
        if (stateSources
            .where((element) =>
                element.name.pascalCase == parsedSource.name.pascalCase)
            .isEmpty) {
          stateSources.add(parsedSource);
        } else {
          final stateSource = stateSources.firstWhere((element) =>
              element.name.pascalCase == parsedSource.name.pascalCase);

          for (var element in parsedSource.dataComponents) {
            if (!stateSource.dataComponents.any((component) =>
                component.name.pascalCase == element.name.pascalCase)) {
              stateSource.dataComponents.add(element);
            }
          }
        }
      }

      for (final stateSource in stateSources) {
        final stateComponents = <DataComponent>{};
        for (final dataComponent in stateSource.dataComponents) {
          stateComponents.add(dataComponent);
        }

        for (final parsedSource in parsedData.sources) {
          parsedSource.dataComponents.removeWhere((element) =>
              stateComponents.any((component) =>
                  component.isGenerated &&
                  component.name.pascalCase == element.name.pascalCase));
        }
      }

      if (parsedData.sources.isNotEmpty) {
        parsedData.sources
            .removeWhere((element) => element.dataComponents.isEmpty);
      }

      await hideProgress();

      emit(state.copyWith(
        config: state.config.copyWith(
          dataComponents: stateComponents.toSet(),
          sources: stateSources.toSet(),
        ),
        parsedData: parsedData,
      ));

      if (parsedData.dataComponents.isEmpty && parsedData.sources.isEmpty) {
        addSr(const SwaggerParserScreenSR.onContinue());
      } else {
        addSr(const SwaggerParserScreenSR.onConflicting());
      }
    } catch (e) {
      await hideProgress();
      addSr(SwaggerParserScreenSR.onError(message: e.toString()));
    }
  }

  FutureOr<void> _onReplace(
    SwaggerParserScreenEventOnReplace event,
    Emitter<SwaggerParserScreenState> emit,
  ) async {
    final stateComponents =
        Set<DataComponent>.from(state.config.dataComponents);

    if (state.parsedData.dataComponents.isNotEmpty) {
      for (final dataComponent in state.parsedData.dataComponents) {
        stateComponents.removeWhere((element) =>
            element.name.pascalCase == dataComponent.name.pascalCase);
        stateComponents.add(dataComponent);
      }
    }

    final stateSources = Set<Source>.from(state.config.sources);

    if (state.parsedData.sources.isNotEmpty) {
      for (var source in state.parsedData.sources) {
        final stateSource = stateSources.firstWhere(
            (element) => element.name.pascalCase == source.name.pascalCase);

        for (var element in source.dataComponents) {
          stateSource.dataComponents
              .removeWhere((e) => e.name.pascalCase == element.name.pascalCase);
          stateSource.dataComponents.add(element);
        }
      }
    }

    emit(state.copyWith(
      config: state.config.copyWith(
        dataComponents: stateComponents.toSet(),
        sources: stateSources.toSet(),
      ),
      parsedData: SwaggerData.empty(),
    ));

    addSr(const SwaggerParserScreenSR.onContinue());
  }
}
