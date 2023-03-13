import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/data/model/local/colored_line.dart';
import 'package:process_run/shell.dart';

extension Logging on Process {
  void log(StreamController<ColoredLine> outputStreamController) {
    this
      ..outLines.asBroadcastStream().listen((event) {
        if (event.contains('Installing flutter_clean_') ||
            event.contains('Making flutter_clean_')) {
          outputStreamController.add(ColoredLine(line: '{#progress}$event'));
        } else {
          outputStreamController.add(ColoredLine(line: event));
        }
        if (event.contains('with exit code')) {
          kill();
        }
      })
      ..errLines.asBroadcastStream().listen((event) {
        outputStreamController.add(ColoredLine(line: '{#error}$event'));
      });
  }
}
