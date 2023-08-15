import 'dart:async';

import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/modify_project_screen/bloc/modify_project_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';

class ModifyProjectScreenBloc extends BaseBloc<ModifyProjectScreenEvent,
    ModifyProjectScreenState, ModifyProjectScreenSR> {
  ModifyProjectScreenBloc()
      : super(const ModifyProjectScreenStateData(config: Config())) {
    on<ModifyProjectScreenEventInit>(_onInit);
    on<ModifyProjectScreenEventChangeTab>(_onChangeTab);
    on<ModifyProjectScreenEventOnScreensChange>(_onScreensChange);
    on<ModifyProjectScreenEventOnGenerate>(_onGenerate);
  }

  FutureOr<void> _onInit(
    ModifyProjectScreenEventInit event,
    Emitter<ModifyProjectScreenState> emit,
  ) async {
    if (event.config.organization.isEmpty) {
      sourceRepository.empty();
      dataComponentRepository.empty();
      screenRepository.empty();
    }

    emit(
      state.copyWith(
        config: event.config.copyWith(
          sources: sourceRepository.sources,
          dataComponents: dataComponentRepository.dataComponents,
          screens: screenRepository.screens,
        ),
      ),
    );
  }

  FutureOr<void> _onChangeTab(
    ModifyProjectScreenEventChangeTab event,
    Emitter<ModifyProjectScreenState> emit,
  ) {
    emit(state.copyWith(currentTab: event.index));
  }

  FutureOr<void> _onScreensChange(
    ModifyProjectScreenEventOnScreensChange event,
    Emitter<ModifyProjectScreenState> emit,
  ) {
    emit(state.copyWith(
      config: state.config.copyWith(
        screens: event.screens,
      ),
    ));
  }

  FutureOr<void> _onGenerate(
    ModifyProjectScreenEventOnGenerate event,
    Emitter<ModifyProjectScreenState> emit,
  ) async {
    emit(state.copyWith(
      config: state.config.copyWith(
        sources: sourceRepository.sources,
        dataComponents: dataComponentRepository.dataComponents,
        screens: screenRepository.screens,
      ),
    ));

    addSr(const ModifyProjectScreenSR.onGenerate());
  }
}
