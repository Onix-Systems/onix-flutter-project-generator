import 'dart:io';

import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:process_run/shell.dart';

extension Logging on Process {
  void log() {
    this
      ..outLines.asBroadcastStream().listen((event) {
        if (event.contains('Installing flutter_clean_') ||
            event.contains('Making flutter_clean_')) {
          outputService.add('{#progress}$event');
        } else {
          outputService.add(event);
        }
        if (event.contains('with exit code') ||
            event.contains('[Storing upload-keystore.jks]')) {
          kill();
        }
      })
      ..errLines.asBroadcastStream().listen((event) {
        outputService.add('{#error}$event');
        if (event.contains('[Storing upload-keystore.jks]')) {
          kill();
        }
      });
  }
}
