import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/sr_mixin.dart';

abstract class BaseBloc<Event, State, SR> extends Bloc<Event, State>
    with SingleResultMixin<Event, State, SR> {
  @protected
  late StreamController<bool> _progressStreamController;

  Stream<bool> get progressStream => _progressStreamController.stream;

  BaseBloc(State initialState) : super(initialState) {
    _progressStreamController = StreamController<bool>.broadcast();
  }

  void showProgress() {
    if (!_progressStreamController.isClosed) {
      _progressStreamController.add(true);
    }
  }

  Future<void> hideProgress() async {
    await Future<void>.delayed(const Duration(milliseconds: 50));
    if (!_progressStreamController.isClosed) {
      _progressStreamController.add(false);
    }
  }

  void dispose() {
    if (!_progressStreamController.isClosed) {
      _progressStreamController.close();
    }
  }
}
