import 'package:mason/mason.dart';
import 'dart:io';
import 'package:process_run/shell.dart';
import 'package:tint/tint.dart';
import 'package:recase/recase.dart';

bool withUI = false;

void run(HookContext context) async {
  if (context.vars['withUI'] != null) {
    withUI = context.vars['withUI'];
  }

  context.vars['platforms'].toString().log();

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

  createArgs.toString().log();

  var flutterCreateProc = await Process.start('flutter', createArgs);

  flutterCreateProc.log();

  var exitCode = await flutterCreateProc.exitCode;

  if (exitCode == 0) {
    'Project created successfully!'.log();
  } else {
    'Failed to create project... Error code: $exitCode!'.error();

    exit(1);
  }

  if (context.vars['use_keytool']) {
    'Keytool will open in new terminal window after project generation...'.log;
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

    context.vars['flavors'].toString().log();

    if (context.vars['flavors'].toString().isNotEmpty) {
      flavors.addAll(context.vars['flavors'].toString().split(', '));
    }

    if (!withUI) {
      print('Add flavors?'.brightYellow().bold().blink());
      print(
          'Type flavor names space separated (except DEV & PROD) or press enter to cancel:'
              .brightCyan()
              .bold());
      print('\u001b[1A\u001b[93;1m');

      String? result = stdin.readLineSync();

      if (result != null && result.toLowerCase().trim().isNotEmpty) {
        var flavorsArray = result.split(' ');
        flavorsArray.forEach((element) {
          if (element.isNotEmpty) {
            flavors.add(element);
          }
        });
      }
    }
  }

  return {
    ...context.vars,
    'isGoRouter': isGoRouter,
    'handLocalization': localizationByHand,
    'flavors': flavors,
    'project_name': context.vars['project_name_dirt'].toString().toSnakeCase,
    'web_only': context.vars['platforms'] == 'web',
  };
}

extension LogString on String {
  void log() {
    if (withUI) {
      print('{#info}$this');
    } else {
      print(this.green().bold());
    }
  }

  void error() {
    if (withUI) {
      print('{#error}$this');
    } else {
      print(this.red().bold());
    }
  }
}

extension Log on Process {
  void log() {
    this.outLines.forEach((element) => print(element));
    if (withUI) {
      this.errLines.forEach((element) => print('{#error}$element'));
    } else {
      this.errLines.forEach((element) => print(element.red()));
    }
  }

  void info() {
    if (withUI) {
      this.errLines.forEach((element) => print('{#info}$element'));
    } else {
      this.errLines.forEach((element) => print(element));
    }
  }
}

extension Case on String {
  String get toSnakeCase => ReCase(this).snakeCase;

  String get toCamelCase => ReCase(this).camelCase;

  String get toPascalCase => ReCase(this).pascalCase;
}
