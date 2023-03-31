import 'package:mason/mason.dart';
import 'dart:io';
import 'package:process_run/shell.dart';
import 'package:recase/recase.dart';

late final String screenPath;

void run(HookContext context) async {
  await createDirs(context);
  await createFiles(context);
  await createRoutes(context);
  if (context.vars['use_bloc']) {
    await createDI(context);
  }

  if (context.vars['build']) {
    var buildProc =
        await Process.start('flutter', ['pub', 'run', 'build_runner', 'build']);

    buildProc.outLines.forEach((element) {
      print(element);
    });

    buildProc.errLines.forEach((element) {
      print(element);
    });

    if (await buildProc.exitCode == 0) {
      print('{#info}Complete with exit code: 0');
    }
  }

  await Process.run('flutter', ['format', '.']);
  await Process.run('rm', ['-r', 'gen']);
}

Future<void> createRoutes(HookContext context) async {
  var routesFile = await File('lib/core/router/app_router.dart');

  String routesContent = routesFile.readAsStringSync();

  if (context.vars['isGoRouter']) {
    routesFile.writeAsString(routesContent.replaceAll('//{consts end}',
        '''static const _${context.vars['screen_name'].toString().toCamelCase} = '/${context.vars['screen_name']}';
      //{consts end}''').replaceAll('//{getters end}',
        '''static String get ${context.vars['screen_name'].toString().toCamelCase}Screen => _${context.vars['screen_name'].toString().toCamelCase};
      //{getters end}''').replaceAll('//{routes end}', '''GoRoute(
          path: _${context.vars['screen_name'].toString().toCamelCase},
          builder: (context, state) =>
              const ${context.vars['screen_name'].toString().toPascalCase}Screen(),
        ),
        //{routes end}''').replaceAll('//{imports end}',
        '''import 'package:${context.vars['projectName']}/presentation/screen/${context.vars['screen_name']}_screen/${context.vars['screen_name']}_screen.dart';
//{imports end}'''));
  } else {
    routesFile.writeAsString(routesContent.replaceAll(
        '//{routes end}', '''AdaptiveRoute(
      page: ${context.vars['screen_name'].toString().toPascalCase}Route.page,
      path: '/${context.vars['screen_name'].toString().toCamelCase}Screen',
    ),
    //{routes end}''').replaceAll('//{imports end}',
        '''import 'package:${context.vars['projectName']}/presentation/screen/${context.vars['screen_name']}_screen/${context.vars['screen_name']}_screen.dart';
//{imports end}'''));
  }
}

Future<void> createDI(HookContext context) async {
  var diFile = await File('lib/core/di/bloc.dart');

  String diContent = diFile.readAsStringSync();

  diFile.writeAsString(diContent.replaceFirst(
      'void registerBloc(GetIt getIt) {',
      'import \'package:${context.vars['projectName']}/presentation/screen/${context.vars['screen_name']}_screen/bloc/${context.vars['screen_name']}_screen_bloc.dart\';\n\nvoid registerBloc(GetIt getIt) {\n  getIt.registerFactory<${context.vars['screen_name'].toString().toPascalCase}ScreenBloc>(${context.vars['screen_name'].toString().toPascalCase}ScreenBloc.new);'));
}

Future<void> createDirs(HookContext context) async {
  screenPath = 'lib/presentation/screen/${context.vars['screen_name']}_screen';
  await Directory(screenPath).create(recursive: true);

  if (context.vars['use_bloc']) {
    await Directory('$screenPath/bloc').create(recursive: true);
  }
}

Future<void> createFiles(HookContext context) async {
  var screenFile =
      await File('$screenPath/${context.vars['screen_name']}_screen.dart')
          .create();

  if (context.vars['use_bloc']) {
    String screenContent = await File('gen/screen_bloc.tmp').readAsStringSync();

    await screenFile.writeAsString(screenContent
        .replaceAll('\${projectName}', context.vars['projectName'])
        .replaceAll('\${screen_name}', context.vars['screen_name'])
        .replaceAll('\${screenName.pascalCase}',
            context.vars['screen_name'].toString().toPascalCase));

    var importsFile = await File(
            '${screenPath}/bloc/${context.vars['screen_name']}_screen_bloc_imports.dart')
        .create();

    importsFile.writeAsString('''
export '${context.vars['screen_name']}_screen_bloc.dart';
export '${context.vars['screen_name']}_screen_models.dart';
    ''');

    var modelsFile = await File(
            '${screenPath}/bloc/${context.vars['screen_name']}_screen_models.dart')
        .create();

    String modelsContent = await File('gen/bloc_models.tmp').readAsStringSync();

    await modelsFile.writeAsString(modelsContent
        .replaceAll('\${screenName}', context.vars['screen_name'])
        .replaceAll('\${screenName.pascalCase}',
            context.vars['screen_name'].toString().toPascalCase));

    var blocFile = await File(
            '${screenPath}/bloc/${context.vars['screen_name']}_screen_bloc.dart')
        .create();

    String blocContent = await File('gen/bloc.tmp').readAsStringSync();

    await blocFile.writeAsString(blocContent
        .replaceAll('\${projectName}', context.vars['projectName'])
        .replaceAll('\${screenName}', context.vars['screen_name'])
        .replaceAll('\${screenName.pascalCase}',
            context.vars['screen_name'].toString().toPascalCase));
  } else {
    String screenContent = await File('gen/screen.tmp').readAsStringSync();

    await screenFile.writeAsString(screenContent.replaceAll(
        '\${screenName.pascalCase}',
        context.vars['screen_name'].toString().toPascalCase));
  }
}

extension Case on String {
  String get toSnakeCase => ReCase(this).snakeCase;

  String get toCamelCase => ReCase(this).camelCase;

  String get toPascalCase => ReCase(this).pascalCase;
}
