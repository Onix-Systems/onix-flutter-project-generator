import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/fetch_swagger_data_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc_imports.dart';

class SwaggerParserScreenBloc extends BaseBloc<SwaggerParserScreenEvent,
    SwaggerParserScreenState, SwaggerParserScreenSR> {
  final FetchSwaggerDataUseCase _fetchSwaggerDataUseCase;

  SwaggerParserScreenBloc(this._fetchSwaggerDataUseCase)
      : super(
          const SwaggerParserScreenStateData(config: Config()),
        ) {
    on<SwaggerParserScreenEventInit>(_onInit);
    on<SwaggerParserScreenEventParse>(_onParse);
  }

  void _onInit(
    SwaggerParserScreenEventInit event,
    Emitter<SwaggerParserScreenState> emit,
  ) {
    emit(state.copyWith(config: event.config));
  }

  Future<void> _onParse(
    SwaggerParserScreenEventParse event,
    Emitter<SwaggerParserScreenState> emit,
  ) async {
    if (event.url.isEmpty) {
      addSr(const SwaggerParserScreenSR.onContinue());
    }
    emit(
      state.copyWith(
        config: state.config.copyWith(
          swaggerUrl: event.url,
        ),
      ),
    );

    showProgress();

    final swaggerComponentsResult =
        await _fetchSwaggerDataUseCase(url: event.url);

    await hideProgress();
    if (swaggerComponentsResult.success) {
      addSr(const SwaggerParserScreenSR.onContinue());
    } else {
      addSr(const SwaggerParserScreenSR.onParseError());
    }
  }
}
