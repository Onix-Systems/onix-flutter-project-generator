import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/swagger_parser/swagger_parser.dart';

class SwaggerParserScreenBloc extends BaseBloc<SwaggerParserScreenEvent,
    SwaggerParserScreenState, SwaggerParserScreenSR> {
  SwaggerParserScreenBloc()
      : super(const SwaggerParserScreenStateData(config: Config())) {
    on<SwaggerParserScreenEventInit>(_onInit);
    on<SwaggerParserScreenEventOnUrlChanged>(_onUrlChanged);
    on<SwaggerParserScreenEventParse>(_onParse);
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

      final dataComponents = state.config.dataComponents.toList()
        ..addAll(parsedData.dataComponents)
        ..sort((a, b) => a.name.compareTo(b.name));

      final sources = state.config.sources.toList()
        ..addAll(parsedData.sources)
        ..sort((a, b) => a.name.compareTo(b.name));

      await hideProgress();

      emit(state.copyWith(
        config: state.config.copyWith(
          dataComponents: dataComponents.toSet(),
          sources: sources.toSet(),
        ),
      ));

      addSr(const SwaggerParserScreenSR.onContinue());
    } catch (e) {
      await hideProgress();
      addSr(SwaggerParserScreenSR.onError(message: e.toString()));
    }
  }
}
