import 'package:mason/mason.dart';
import 'dart:io';
import 'package:process_run/shell.dart';
import 'package:recase/recase.dart';

void run(HookContext context) async {
  var pwd = await Process.run('pwd', []);

  String projectName = pwd.outLines.first.split('/').last;

  var routesFile = await File('lib/core/router/app_router.dart');

  String routesContent = routesFile.readAsStringSync();

  var isGoRouter = routesContent.contains('package:go_router/go_router.dart');

  var screenName = context.vars['screen_name'].toString().toSnakeCase;

  if (screenName.endsWith('_screen')) {
    screenName = screenName.substring(0, screenName.length - 7);
  }

  context.vars = {
    ...context.vars,
    'screen_name': screenName,
    'projectName': projectName,
    'isGoRouter': isGoRouter,
  };
}

extension Case on String {
  String get toSnakeCase => ReCase(this).snakeCase;

  String get toCamelCase => ReCase(this).camelCase;

  String get toPascalCase => ReCase(this).pascalCase;
}
