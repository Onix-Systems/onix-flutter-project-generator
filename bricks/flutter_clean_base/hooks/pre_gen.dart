import 'package:mason/mason.dart';
import 'dart:io';
import 'package:process_run/shell.dart';
import 'package:tint/tint.dart';
import 'package:recase/recase.dart';

void run(HookContext context) async {
  'Creating flutter project...'.log();

  String name = context.vars['project_name_dirt'].toString().toSnakeCase;
  String org = context.vars['project_org'];

  List<String> createArgs = [];

  createArgs.addAll(['create', '--platforms=${context.vars['platforms']}']);

  if (context.vars['platforms'].contains('ios') ||
      context.vars['platforms'].contains('android') ||
      context.vars['platforms'].contains('windows') ||
      context.vars['platforms'].contains('macos')) {
    createArgs.addAll(['--project-name', name, '-t', 'app']);

    if (context.vars['platforms'].contains('ios')) {
      createArgs.addAll(['-i', 'swift']);
    }

    if (context.vars['platforms'].contains('android')) {
      createArgs.addAll(['-a', 'kotlin']);
    }

    createArgs.addAll(['--org', org]);
  }

  createArgs.add(name);

  var flutterCreateProcess = await Process.start('flutter', createArgs);

  flutterCreateProcess.log();

  var exitCode = await flutterCreateProcess.exitCode;

  if (exitCode == 0) {
    'Project created successfully!'.log();
  } else {
    'Failed to create project... Error code: $exitCode!'.error();

    exit(1);
  }

  context.vars = await _initCustomVars(context);
}

Future<Map<String, dynamic>> _initCustomVars(HookContext context) async {
  final isGoRouter = context.vars['navigation'] == 'goRouter' ? true : false;
  final localizationByHand =
      context.vars['localization'] == 'flutter_gen' ? true : false;

  var flavors = [];

  if (context.vars['flavorizr'] == true) {
    flavors = ['dev', 'prod'];

    if (context.vars['flavors']
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .isNotEmpty) {
      flavors.addAll(context.vars['flavors']
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(', '));
    }
  }

  return {
    ...context.vars,
    'isGoRouter': isGoRouter,
    'handLocalization': localizationByHand,
    'flavors': flavors,
    'project_name': context.vars['project_name_dirt'].toString().toSnakeCase,
    'web_only': context.vars['platforms'] == 'web',
    'macOsEnabled': context.vars['platforms'].containsObject('macos'),
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

extension Log on Process {
  void log() {
    this.outLines.forEach((element) => print('$element'));
    this.errLines.forEach((element) => print('{#error}$element'));
  }

  void info() {
    this.errLines.forEach((element) => print('{#info}$element'));
  }
}

extension Case on String {
  String get toSnakeCase => ReCase(this).snakeCase;

  String get toCamelCase => ReCase(this).camelCase;

  String get toPascalCase => ReCase(this).pascalCase;
}
