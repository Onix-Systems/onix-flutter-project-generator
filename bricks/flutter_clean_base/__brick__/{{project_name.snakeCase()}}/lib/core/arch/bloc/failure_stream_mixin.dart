import 'dart:async';

import 'package:{{project_name}}/core/arch/domain/entity/failure/failure.dart';

mixin class FailureStreamMixin {
  final StreamController<Failure> _errorStreamController =
      StreamController<Failure>.broadcast();

  Stream<Failure> get failureStream => _errorStreamController.stream;

  void onFailure(Failure failure) {
    if (!_errorStreamController.isClosed) {
      _errorStreamController.add(failure);
    }
  }

  void closeFailureStream() {
    if (!_errorStreamController.isClosed) {
      _errorStreamController.close();
    }
  }
}
