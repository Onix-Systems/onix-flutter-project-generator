import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/bloc/summary_screen_bloc_imports.dart';

class SummaryScreenBloc
    extends BaseBloc<SummaryScreenEvent, SummaryScreenState, SummaryScreenSR> {
  SummaryScreenBloc() : super(const SummaryScreenStateData(config: Config())) {
    on<SummaryScreenEventInit>(_onInit);
  }

  void _onInit(
    SummaryScreenEventInit event,
    Emitter<SummaryScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: event.config.copyWith(
          screens: screenRepository.screens,
        ),
      ),
    );
  }
}
