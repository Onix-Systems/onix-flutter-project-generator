part of '../widgets/build_body.dart';

Future<bool> flutterProjectGen(
    {required String projectPath,
    required String projectName,
    required String orgName,
    required File configFile,
    required StreamController<ColoredLine> outputStreamController,
    required List<ColoredLine> outputText}) async {
  try {
    outputStreamController
        .add(ColoredLine(line: '{#info}Getting mason & bricks...'));

    var mainProcess =
        await Process.start('zsh', [], workingDirectory: projectPath);

    mainProcess.log(outputStreamController);
    mainProcess.stdin.writeln('source \$HOME/.zshrc');
    mainProcess.stdin.writeln('source \$HOME/.bash_profile');
    mainProcess.stdin.writeln('dart pub global activate mason_cli');
    mainProcess.stdin.writeln('mason cache clear');

    mainProcess.stdin.writeln(
        'mason add -g flutter_clean_base --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template --git-path flutter_clean_base');
    mainProcess.stdin.writeln(
        'mason add -g flutter_clean_entity --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template --git-path flutter_clean_entity');
    mainProcess.stdin.writeln(
        'mason add -g flutter_clean_screen --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template --git-path flutter_clean_screen');
    mainProcess.stdin.writeln(
        'mason make flutter_clean_base -c config.json --on-conflict overwrite');

    // mainProcess.stdin.writeln('echo Complete with exit code:');
    if (await mainProcess.exitCode == 0) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

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
        // outputStreamController.add(ColoredLine(line: event));
        if (event.contains('Complete with exit code:') ||
            event.contains('Generated password:')) {
          kill();
        }
      })
      ..errLines.asBroadcastStream().listen((event) {
        outputStreamController.add(ColoredLine(line: '{#error}$event'));
      });
  }
}
