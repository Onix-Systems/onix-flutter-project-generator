import 'dart:io';

import 'package:onix_flutter_bricks/util/extension/logging_extension.dart';

class ProcessStarter {
  static Future<Process> start({
    required String workingDirectory,
    bool exitOnSucceeded = false,
  }) async {
    var mainProcess =
        await Process.start('zsh', [], workingDirectory: workingDirectory);

    mainProcess.log(exitOnSucceeded: exitOnSucceeded);
    mainProcess.stdin.writeln('source \$HOME/.zshrc');
    mainProcess.stdin.writeln('source \$HOME/.bash_profile');

    return mainProcess;
  }
}
