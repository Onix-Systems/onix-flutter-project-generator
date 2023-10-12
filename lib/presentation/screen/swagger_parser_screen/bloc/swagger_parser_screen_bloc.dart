import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/swagger_parser/swagger_parser.dart';
import 'package:recase/recase.dart';

class SwaggerParserScreenBloc extends BaseBloc<SwaggerParserScreenEvent,
    SwaggerParserScreenState, SwaggerParserScreenSR> {
  SwaggerParserScreenBloc()
      : super(
          const SwaggerParserScreenStateData(
            config: Config(),
          ),
        ) {
    on<SwaggerParserScreenEventInit>(_onInit);
    on<SwaggerParserScreenEventParse>(_onParse);
    on<SwaggerParserScreenEventOnReplace>(_onReplace);
    on<SwaggerParserScreenEventOnIgnore>(_onIgnore);
  }

  FutureOr<void> _onInit(
    SwaggerParserScreenEventInit event,
    Emitter<SwaggerParserScreenState> emit,
  ) {
    emit(state.copyWith(
        config: event.config.copyWith(
      sources: sourceRepository.sources,
      dataComponents: dataComponentRepository.dataComponents,
    )));
  }

  FutureOr<void> _onParse(
    SwaggerParserScreenEventParse event,
    Emitter<SwaggerParserScreenState> emit,
  ) async {
    if (state.config.swaggerUrl == event.url) {
      addSr(const SwaggerParserScreenSR.onContinue());
      return;
    }

    emit(state.copyWith(
      config: state.config.copyWith(
        swaggerUrl: event.url,
      ),
    ));

    showProgress();
    try {
      var response = await http.get(Uri.parse(event.url));

      var json = jsonDecode(response.body);

      dataComponentRepository.empty();

      SwaggerParser.parse(
          data: json as Map<String, dynamic>,
          projectName: state.config.projectName);

      bool withConflicts = false;

      for (var dataComponent in dataComponentRepository.dataComponents
          .where((element) => !element.exists)) {
        if (state.config.dataComponents
            .where((element) =>
                element.name.pascalCase == dataComponent.name.pascalCase)
            .isNotEmpty) {
          withConflicts = true;
        } else {
          emit(state.copyWith(
            config: state.config.copyWith(
              dataComponents: {
                ...state.config.dataComponents,
                DataComponent.copyOf(dataComponent),
              },
            ),
          ));
        }
      }

      await hideProgress();

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
    emit(state.copyWith(
      config: state.config.copyWith(
        dataComponents: dataComponentRepository.dataComponents,
        sources: sourceRepository.sources,
      ),
    ));

    addSr(const SwaggerParserScreenSR.onContinue());
  }

  FutureOr<void> _onIgnore(
    SwaggerParserScreenEventOnIgnore event,
    Emitter<SwaggerParserScreenState> emit,
  ) async {
    for (var element
        in state.config.dataComponents.where((element) => !element.exists)) {
      final oldComponent = dataComponentRepository.getDataComponentByName(
          dataComponentName: element.name);

      if (oldComponent != null && oldComponent.sourceName.isNotEmpty) {
        sourceRepository.deleteDataComponentFromSource(
            sourceName: oldComponent.sourceName,
            dataComponentName: element.name);
      }

      dataComponentRepository.modifyComponent(
          oldDataComponentName: element.name, dataComponent: element);
      if (element.sourceName.isNotEmpty) {
        sourceRepository.addDataComponentToSource(
            sourceName: element.sourceName, dataComponentName: element.name);
      }
    }

    addSr(const SwaggerParserScreenSR.onContinue());
  }
}
