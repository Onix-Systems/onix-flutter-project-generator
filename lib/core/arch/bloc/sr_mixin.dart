import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Mixin for extending the block's capabilities to support SingleResult - events that need to be rendered 1 time
/// - Navigation
/// - Toast
/// - Snack
/// - Some interaction with the animation
mixin SingleResultMixin<Event, State, SR> on Bloc<Event, State>
    implements SingleResultProvider<SR>, SingleResultEmmiter<SR> {
  @protected
  final StreamController<SR> _srController = StreamController.broadcast();

  @override
  Stream<SR> get singleResults => _srController.stream;

  @override
  void addSr(SR sr) {
    final observer = Bloc.observer;
    if (observer is SrBlocObserver) observer.onSr(this, sr);
    if (!_srController.isClosed) _srController.add(sr);
  }

  @override
  Future<void> close() {
    _srController.close();

    return super.close();
  }
}

/// Protocol for providing a stream of events [SingleResult]
abstract class SingleResultProvider<SingleResult> {
  Stream<SingleResult> get singleResults;
}

/// Protocol for receiving events [SingleResult]
abstract class SingleResultEmmiter<SingleResult> {
  void addSr(SingleResult sr);
}

/// Extending Observer to support logging SingleResult events
class SrBlocObserver<SR> extends BlocObserver {
  @protected
  @mustCallSuper
  void onSr(Bloc bloc, SR sr) {}
}
