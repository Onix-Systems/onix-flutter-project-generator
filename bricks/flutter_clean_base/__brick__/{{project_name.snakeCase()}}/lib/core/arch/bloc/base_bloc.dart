import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/core/arch/bloc/failure_stream_mixin.dart';
import 'package:{{project_name}}/core/arch/bloc/progress_stream_mixin.dart';
import 'package:{{project_name}}/core/arch/bloc/sr_mixin.dart';

abstract class BaseBloc<Event, State, SR> extends Bloc<Event, State>
    with
        SingleResultMixin<Event, State, SR>,
        ProgressStreamMixin,
        FailureStreamMixin {
  BaseBloc(super.initialState);

  void dispose() {
    closeProgressStream();
    closeFailureStream();
  }
}
