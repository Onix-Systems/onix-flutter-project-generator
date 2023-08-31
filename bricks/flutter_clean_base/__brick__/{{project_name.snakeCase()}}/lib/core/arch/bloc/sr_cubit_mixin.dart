import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Mixin for extending the block's capabilities to support SingleResult - events that need to be rendered 1 time
/// - Navigation
/// - Toast
/// - Snack
/// - Some interaction with the animation
mixin SingleResultCubitMixin<State, SR> on Cubit<State>
    implements SingleResultProvider<SR>, SingleResultEmitter<SR> {
  @protected
  final StreamController<SR> _srController = StreamController.broadcast();

  @override
  Stream<SR> get singleResults => _srController.stream;

  @override
  void addSr(SR sr) {
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
//ignore: one_member_abstracts
abstract class SingleResultEmitter<SingleResult> {
  void addSr(SingleResult sr);
}
