import 'dart:async';

import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/source.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/modify_project_screen/bloc/modify_project_screen_bloc_imports.dart';

import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';

class ModifyProjectScreenBloc extends BaseBloc<ModifyProjectScreenEvent,
    ModifyProjectScreenState, ModifyProjectScreenSR> {
  ModifyProjectScreenBloc()
      : super(const ModifyProjectScreenStateData(config: Config())) {
    on<ModifyProjectScreenEventInit>(_onInit);
    on<ModifyProjectScreenEventChangeTab>(_onChangeTab);
    on<ModifyProjectScreenEventOnScreensChange>(_onScreensChange);
    on<ModifyProjectScreenEventOnDataComponentsChange>(_onDataComponentsChange);
  }

  FutureOr<void> _onInit(
    ModifyProjectScreenEventInit event,
    Emitter<ModifyProjectScreenState> emit,
  ) async {
    if (event.config.organization.isEmpty) {
      sourceRepository.empty();
      dataComponentRepository.empty();
    }

    final config = await configSource.getConfig(
        configPath:
            '${event.config.projectPath}/${event.config.projectName}/.gen_config.json');

    logger.f('config: $config');

    emit(state.copyWith(
        config: event.config.copyWith(
      sources: sourceRepository.sources,
      dataComponents: dataComponentRepository.dataComponents,
    )));
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

  FutureOr<void> _onDataComponentsChange(
    ModifyProjectScreenEventOnDataComponentsChange event,
    Emitter<ModifyProjectScreenState> emit,
  ) {
    // emit(state.copyWith(
    //   config: state.config.copyWith(
    //     dataComponents: event.dataComponents,
    //     sources: {
    //       Source(
    //         name: 'Time',
    //         exists: true,
    //         isGenerated: false,
    //         dataComponents: [
    //           DataComponent(
    //             name: 'Time',
    //             exists: true,
    //             isGenerated: false,
    //             properties: [
    //               Property(name: 'currentDateTime', type: 'DateTime')
    //             ],
    //           )..setSourceName('Time'),
    //         ],
    //         dataComponentsNames: ['Time'],
    //       ),
    //       ...sourceRepository.sources
    //     },
    //   ),
    // ));
  }
}
