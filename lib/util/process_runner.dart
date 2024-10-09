import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/util/extension/output/output_message_extension.dart';
import 'package:process_run/shell.dart';

class ProcessRunner {
  final OutputService _outputService;
  Process? _process;
  StreamSubscription<String>? _outLinesSubscription;
  StreamSubscription<String>? _errorLinesSubscription;

  ProcessRunner(this._outputService);

  Future<void> newProcess({
    required String workingDirectory,
    bool exitOnSucceeded = false,
  }) async {
    _process = await Process.start(
      'zsh',
      [],
      workingDirectory: workingDirectory,
    );

    _outLinesSubscription = _process?.outLines.asBroadcastStream().listen(
      (event) {
        if (event.contains('Installing flutter_clean_') ||
            event.contains('Making flutter_clean_')) {
          _outputService.add(event.toProgressMessage());
        } else {
          _outputService.add(event);
        }

        if (event.contains('with exit code') ||
            event.contains('[Storing upload-keystore.jks]') ||
            (exitOnSucceeded && event.contains('[INFO] Succeeded after'))) {
          _kill();
        }
      },
    );

    _errorLinesSubscription = _process?.errLines.asBroadcastStream().listen(
      (event) {
        if (event.contains('--:--:--')) {
          _outputService.add(event.toProgressMessage());
        } else {
          _outputService.add(event.toErrorMessage());
          if (event.contains('[Storing upload-keystore.jks]')) {
            _kill();
          }
        }
      },
    );

    _process?.stdin.writeln(r'source $HOME/.zshrc');
    _process?.stdin.writeln(r'source $HOME/.bash_profile');
  }

  void execCommand(String command) {
    try {
      _process?.stdin.writeln(command);
    } catch (e) {
      logger.w('Command not executed because process had not started.');
    }
  }

  Future<int> waitForExit() async {
    return _process?.exitCode ?? Future.value(-1);
  }

  void dispose() {
    _outLinesSubscription?.cancel();
    _errorLinesSubscription?.cancel();
  }

  void _kill() {
    try {
      _process?.kill();
    } catch (e) {
      logger.w('Process not killed because process had not started.');
    }
  }
}
