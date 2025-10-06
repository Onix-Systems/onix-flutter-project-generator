import 'dart:developer';

import 'package:logger/logger.dart';

class AppConsoleLogOutput extends LogOutput {
  final String prefix;
  final String linesSeparator;

  AppConsoleLogOutput({
    this.prefix = '',
    this.linesSeparator = '',
  });

  @override
  void output(OutputEvent event) {
    log('$prefix${event.lines.join(linesSeparator)}');
  }
}
