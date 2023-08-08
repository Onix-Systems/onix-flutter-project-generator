import 'dart:async';

import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/summary_screen/bloc/summary_screen_bloc_imports.dart';

class SummaryScreenBloc
    extends BaseBloc<SummaryScreenEvent, SummaryScreenState, SummaryScreenSR> {
  SummaryScreenBloc() : super(SummaryScreenState()) {
    on<SummaryScreenEventInit>(_onInit);
    add(const SummaryScreenEvent.init());
  }

  FutureOr<void> _onInit(
    SummaryScreenEventInit event,
    Emitter<SummaryScreenState> emit,
  ) {}
}
