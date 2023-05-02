import 'package:mason/mason.dart';
import 'dart:io';
import 'package:process_run/shell.dart';

void run(HookContext context) async {
  var pwd = await Process.run('pwd', []);
  String projectName = pwd.outLines.first.split('/').last;

  context.vars['entities'].toString().log();

  context.vars = {
    ...context.vars,
    'projectName': projectName,
  };
}

extension LogString on String {
  void log() {
    print('{#info}$this');
  }

  void error() {
    print('{#error}$this');
  }
}
