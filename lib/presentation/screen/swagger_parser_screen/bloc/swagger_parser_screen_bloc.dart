import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/service/config_service/config_service.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/empty_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/fetch_swagger_data_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/restore_components_use_case.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc_imports.dart';

class SwaggerParserScreenBloc extends BaseBloc<SwaggerParserScreenEvent,
    SwaggerParserScreenState, SwaggerParserScreenSR> {
  final FetchSwaggerDataUseCase _fetchSwaggerDataUseCase;
  final GetComponentsUseCase _getComponentsUseCase;
  final RestoreComponentsUseCase _restoreComponentsUseCase;
  final ClearSwaggerComponentsUseCase _clearSwaggerComponentsUseCase;
  final ConfigService _configService;

  Config get _config => _configService.config;

  SwaggerParserScreenBloc({
    required FetchSwaggerDataUseCase fetchSwaggerDataUseCase,
    required GetComponentsUseCase getComponentsUseCase,
    required RestoreComponentsUseCase restoreComponentsUseCase,
    required ClearSwaggerComponentsUseCase clearSwaggerComponentsUseCase,
    required ConfigService configService,
  })  : _configService = configService,
        _fetchSwaggerDataUseCase = fetchSwaggerDataUseCase,
        _getComponentsUseCase = getComponentsUseCase,
        _restoreComponentsUseCase = restoreComponentsUseCase,
        _clearSwaggerComponentsUseCase = clearSwaggerComponentsUseCase,
        super(
          SwaggerParserScreenStateData(
            config: configService.config,
            componentsBeforeParsing: Components.empty(),
          ),
        ) {
    on<SwaggerParserScreenEventInit>(_onInit);
    on<SwaggerParserScreenEventParse>(_onParse);
    on<SwaggerParserScreenEventOnCancel>(_onCancel);
  }

  void _onInit(
    SwaggerParserScreenEventInit event,
    Emitter<SwaggerParserScreenState> emit,
  ) {
    final initialComponents = _getComponentsUseCase();
    emit(
      state.copyWith(
        config: _configService.config,
        componentsBeforeParsing: initialComponents,
      ),
    );
  }

  Future<void> _onParse(
    SwaggerParserScreenEventParse event,
    Emitter<SwaggerParserScreenState> emit,
  ) async {
    _configService.updateWith(
      swaggerUrl: event.url,
    );

    if (event.url.isEmpty) {
      emit(
        state.copyWith(
          config: _config,
        ),
      );

      _clearSwaggerComponentsUseCase();

      addSr(const SwaggerParserScreenSR.onContinue());

      return;
    }

    showProgress();

    final swaggerComponentsResult = await _fetchSwaggerDataUseCase(
      url: event.url,
      arch: state.config.arch,
      overwriteDuplicates: event.overwrite,
    );

    await hideProgress();

    if (swaggerComponentsResult.isError) {
      onFailure(swaggerComponentsResult.asError.error);
      return;
    }

    emit(
      state.copyWith(
        config: _config,
      ),
    );
    addSr(const SwaggerParserScreenSR.onContinue());
  }

  void _onCancel(
    SwaggerParserScreenEventOnCancel event,
    Emitter<SwaggerParserScreenState> emit,
  ) {
    _configService.updateWith(
      swaggerUrl: '',
    );
    _restoreComponentsUseCase(components: state.componentsBeforeParsing);
  }
}
