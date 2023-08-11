import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/swagger_parser/swagger_parser.dart';
import 'package:recase/recase.dart';

class SwaggerParserScreenBloc extends BaseBloc<SwaggerParserScreenEvent,
    SwaggerParserScreenState, SwaggerParserScreenSR> {
  SwaggerParserScreenBloc()
      : super(
          SwaggerParserScreenStateData(
            config: const Config(),
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

      SwaggerParser.parse(
          data: json as Map<String, dynamic>,
          projectName: state.config.projectName);

      bool withConflicts = false;

      for (var dataComponent in dataComponentRepository.dataComponents) {
        if (state.config.dataComponents
            .where((element) =>
                element.name.pascalCase == dataComponent.name.pascalCase)
            .isEmpty) {
          dataComponentRepository.dataComponents
              .add(DataComponent.copyOf(dataComponent));
        } else {
          withConflicts = true;
        }
      }

      for (var source in state.config.sources) {
        final stateSource = sourceRepository.getSourceByName(source.name);
        if (stateSource == null) {
          sourceRepository.addSource(Source.copyOf(source));
        } else {
          for (var element in source.dataComponents) {
            if (!stateSource.dataComponents.any((component) =>
                component.name.pascalCase == element.name.pascalCase)) {
              sourceRepository.addDataComponentToSource(
                  stateSource, DataComponent.copyOf(element));
            } else {
              withConflicts = true;
            }
          }
        }
      }

      await hideProgress();

      emit(state.copyWith(
        config: state.config.copyWith(
          dataComponents: dataComponentRepository.dataComponents,
          sources: sourceRepository.sources,
        ),
      ));

      if (withConflicts) {
        addSr(const SwaggerParserScreenSR.onConflicting());
      } else {
        addSr(const SwaggerParserScreenSR.onContinue());
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
    final stateComponents = dataComponentRepository.dataComponents;

    if (dataComponentRepository.dataComponents.isNotEmpty) {
      for (final dataComponent in dataComponentRepository.dataComponents) {
        stateComponents.removeWhere((element) =>
            element.name.pascalCase == dataComponent.name.pascalCase);
        stateComponents.add(dataComponent);
      }
    }

    if (sourceRepository.sources.isNotEmpty) {
      for (var source in sourceRepository.sources) {
        final stateSource = sourceRepository.getSourceByName(source.name);

        if (stateSource != null) {
          for (var element in source.dataComponents) {
            sourceRepository.modifyDataComponentInSource(
                stateSource, DataComponent.copyOf(element), element.name);
          }
        }
      }
    }

    emit(state.copyWith(
      config: state.config.copyWith(
        dataComponents: dataComponentRepository.dataComponents,
        sources: sourceRepository.sources,
      ),
    ));

    addSr(const SwaggerParserScreenSR.onContinue());
  }
}
