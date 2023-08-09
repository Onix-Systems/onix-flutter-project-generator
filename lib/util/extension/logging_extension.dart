import 'dart:io';

import 'package:onix_flutter_bricks/core/di/services.dart';
import 'package:process_run/shell.dart';

extension Logging on Process {
  void log({bool exitOnSucceeded = false}) {
    this
      ..outLines.asBroadcastStream().listen((event) {
        if (event.contains('Installing flutter_clean_') ||
            event.contains('Making flutter_clean_')) {
          outputService.add('{#progress}$event');
        } else {
          outputService.add(event);
        }

        if (event.contains('with exit code') ||
            event.contains('[Storing upload-keystore.jks]') ||
            (exitOnSucceeded && event.contains('[INFO] Succeeded after'))) {
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
