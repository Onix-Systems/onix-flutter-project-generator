import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/sr_mixin.dart';
import 'package:onix_flutter_bricks/core/arch/domain/entity/failure/failure.dart';

abstract class BaseBloc<Event, State, SR> extends Bloc<Event, State>
    with SingleResultMixin<Event, State, SR> {
  @protected
  late StreamController<Failure> _errorStreamController;
  @protected
  late StreamController<bool> _progressStreamController;

  Stream<Failure> get failureStream => _errorStreamController.stream;
  Stream<bool> get progressStream => _progressStreamController.stream;

  BaseBloc(super.initialState) {
    _errorStreamController = StreamController<Failure>.broadcast();
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

  void onFailure(Failure failure) {
    if (!_errorStreamController.isClosed) {
      _errorStreamController.add(failure);
    }
  }

  void dispose() {
    if (!_errorStreamController.isClosed) {
      _errorStreamController.close();
    }
    if (!_progressStreamController.isClosed) {
      _progressStreamController.close();
    }
  }
}
