import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/bloc/data_components_screen_v2_bloc_imports.dart';

class DataComponentsScreenV2Bloc extends BaseBloc<DataComponentsScreenV2Event,
    DataComponentsScreenV2State, DataComponentsScreenV2SR> {
  final GetSwaggerComponentsUseCase _getSwaggerComponentsUseCase;

  DataComponentsScreenV2Bloc(this._getSwaggerComponentsUseCase)
      : super(const DataComponentsScreenV2StateData(config: Config())) {
    on<DataComponentsScreenV2IInit>(_onInit);
  }

  Future<void> _onInit(
    DataComponentsScreenV2IInit event,
    Emitter<DataComponentsScreenV2State> emit,
  ) async {
    final components = await _getSwaggerComponentsUseCase();
    emit(
      state.copyWith(
        config: event.config,
        components: components,
      ),
    );
  }
}
