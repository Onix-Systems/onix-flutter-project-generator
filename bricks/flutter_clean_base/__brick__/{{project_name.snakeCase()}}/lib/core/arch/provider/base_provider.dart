import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/domain/entity/failure/failure.dart';

abstract class BaseProvider<S> extends ChangeNotifier {
  @protected
  late StreamController<Failure> _errorStreamController;

  @protected
  late StreamController<bool> _progressStreamController;

  Stream<Failure> get failureStream => _errorStreamController.stream;

  Stream<bool> get progressStream => _progressStreamController.stream;

  late S state;

  BaseProvider(
    this.state,
  ) {
    _errorStreamController = StreamController<Failure>.broadcast();
    _progressStreamController = StreamController<bool>.broadcast();
  }

  void showProgress() {
    Future<void>.delayed(const Duration(milliseconds: 50)).then((_) {
      if (!_progressStreamController.isClosed) {
        _progressStreamController.add(true);
      }
    });
  }

  void hideProgress() {
    Future<void>.delayed(const Duration(milliseconds: 50)).then((_) {
      if (!_progressStreamController.isClosed) {
        _progressStreamController.add(false);
      }
    });
  }

  void onFailure(Failure failure) {
    if (!_errorStreamController.isClosed) {
      _errorStreamController.add(failure);
    }
  }

  void processFailure(
    Failure failure,
  ) {
    onFailure(failure);
  }

  @override
  void dispose() {
    if (!_errorStreamController.isClosed) {
      _errorStreamController.close();
    }
    if (!_progressStreamController.isClosed) {
      _progressStreamController.close();
    }
    super.dispose();
  }
}

abstract class ProviderState {}
