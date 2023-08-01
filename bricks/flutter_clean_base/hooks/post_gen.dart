import 'package:mason/mason.dart';
import 'dart:io';
import 'package:process_run/shell.dart';
import 'package:tint/tint.dart';
import 'dart:math';
import 'package:recase/recase.dart';

late String name;
bool withUI = false;

void run(HookContext context) async {
  // 'Complete with exit code: 0!'.log();
  // return;

  name = context.vars['project_name'].toString().toSnakeCase;

  if (!context.vars['platforms'].contains('android')) {
    await Process.run('rm', ['-rf', '$name/android']);
  }

  if (context.vars['withUI'] != null) {
    withUI = context.vars['withUI'];
  }

  if (!context.vars['handLocalization']) {
    await Process.run('rm', ['app_en.arb'],
        workingDirectory: '$name/lib/core/app/localization/l10n');
  } else {
    await Process.run('rm', ['intl_en.arb'],
        workingDirectory: '$name/lib/core/app/localization/l10n');
  }

  await Process.run('find', ['$name', '-name', '.g', '-type', 'f', '-delete']);

  File pubspecFile = File('$name/pubspec.gen.yaml');

  String pubspecContent = await pubspecFile.readAsString();

  if (!context.vars['platforms'].contains('android')) {
    pubspecContent =
        pubspecContent.replaceAll('android: true', 'android: false');
  }

  if (!context.vars['platforms'].contains('ios')) {
    pubspecContent = pubspecContent.replaceAll('ios: true', 'ios: false');
  }

  if (!context.vars['platforms'].contains('web')) {
    pubspecContent = pubspecContent.replaceAll('''web: 
    generate: true''', '''web: 
    generate: false''');
  }

  if (!context.vars['platforms'].contains('macos')) {
    pubspecContent = pubspecContent.replaceAll('''macos: 
    generate: true''', '''macos: 
    generate: false''');
  }

  if (!context.vars['platforms'].contains('windows')) {
    pubspecContent = pubspecContent.replaceAll('''windows: 
    generate: true''', '''windows: 
    generate: false''');
  }

  pubspecFile.writeAsStringSync(pubspecContent);

  await Process.run('cp', ['pubspec.gen.yaml', 'pubspec.yaml'],
      workingDirectory: name);

  await Process.run('rm', ['pubspec.gen.yaml'], workingDirectory: name);

  await getDependencies(context);
  var exitCode = await generate(context);

  if (context.vars['flavorizr']) {
    await flavorize(context);
  } else {
    await Process.run('rm', ['dev.xml', 'prod.xml'],
        workingDirectory: '$name/.idea/runConfigurations');

    var iconsProc = await Process.start('flutter',
        ['pub', 'run', 'flutter_launcher_icons:main', '-f', 'pubspec.yaml'],
        workingDirectory: name);

    iconsProc.log();
  }

  await Process.run('mv', ['app.gen.dart', 'app/app.dart'],
      workingDirectory: '$name/lib');

  await Process.run('rm', ['app.dart'], workingDirectory: '$name/lib');

  if (!context.vars['handLocalization']) {
    var localizationProcess = await Process.start(
        'flutter', ['pub', 'run', 'intl_utils:generate'],
        workingDirectory: name);

    localizationProcess.log();

    exitCode += await localizationProcess.exitCode;
  }

  var formatProcess =
      await Process.run('flutter', ['format', '.'], workingDirectory: '$name');

  int formatCode = formatProcess.exitCode;

  var sorterProcess = await Process.start(
      'flutter', ['pub', 'run', 'import_sorter:main', '--no-comments'],
      workingDirectory: name);

  sorterProcess.log();

  int sorterCode = await sorterProcess.exitCode;

  exitCode += formatCode + sorterCode;

  await correct(context);
  if (context.vars['use_keytool'] &&
      context.vars['platforms'].contains('android')) {
    await addSigning(context);
  }

  'Complete with exit code: $exitCode!'.log();
}

Future<void> getDependencies(HookContext context) async {
  List<String> dependencies = [
    'dio',
    'pretty_dio_logger',
    'dio_cache_interceptor',
    'dio_cache_interceptor_hive_store',
    'hive_flutter',
    'freezed_annotation',
    'json_annotation',
    'get_it',
    'flutter_bloc',
    'flutter_secure_storage',
    'shared_preferences',
    'connectivity_plus',
    'internet_connection_checker',
    'retry',
    'encrypt',
    'path_provider',
    'logger',
    'loader_overlay',
    'fluttertoast',
  ];

  if (!context.vars['web_only']) {
    dependencies.add('flutter_screenutil');
  }

  List<String> devDependencies = [
    'build_runner',
    'freezed',
    'json_serializable',
    'import_sorter',
    'dart_code_metrics',
  ];

  switch (context.vars['navigation']) {
    case 'goRouter':
      dependencies.add('go_router');
      break;
    case 'autoRouter':
      dependencies.add('auto_route');
      devDependencies.add('auto_route_generator');
      break;
    default:
  }

  if (context.vars['flavorizr']) {
    devDependencies.add('flutter_flavorizr');
  } else {
    devDependencies.add('flutter_launcher_icons');
  }

  if (context.vars['device_preview']) {
    dependencies.add('device_preview');
  }

  if (context.vars['handLocalization']) {
    await Process.run('dart', ['pub', 'global', 'activate', 'flutter_gen']);
  } else {
    dependencies.addAll(['intl', 'intl_utils']);
  }

  if (context.vars['theme_generate']) {
    dependencies.add('theme_tailor_annotation');
    devDependencies.add('theme_tailor');
  }

  /*==========================
  flutter pub add starts here
  ==========================*/
  'Getting dependencies...'.log();

  int exitCode = 0;

  for (var package in dependencies) {
    'Getting $package'.log();
    var depProc = await Process.start('flutter', ['pub', 'add', package],
        workingDirectory: name);

    depProc.log();

    exitCode = await depProc.exitCode;
  }

  if (exitCode == 0) {
    'Dependencies installed successfully'.log();
  } else {
    'Failed to install dependencies... Exit code: $exitCode'.error();
    exitBrick();
  }

  'Getting dev dependencies...'.log();

  for (var package in devDependencies) {
    'Getting $package'.log();
    var devProc = await Process.start('flutter', ['pub', 'add', '-d', package],
        workingDirectory: name);

    devProc.log();

    exitCode = await devProc.exitCode;
  }

  if (exitCode == 0) {
    'Dev dependencies installed successfully'.log();
  } else {
    'Failed to install dev dependencies... Exit code: $exitCode'.error();
    exitBrick();
  }
}

Future<int> generate(HookContext context) async {
  'Start build generator...'.log();

  var buildRunnerProc = await Process.start(
      'flutter', ['pub', 'run', 'build_runner', 'build'],
      workingDirectory: name);

  buildRunnerProc.log();

  var exitCode = await buildRunnerProc.exitCode;

  if (exitCode == 0) {
    'Generate complete successfully'.log();
  } else {
    'Failed to generate... Exit code: $exitCode'.error();
    exitBrick();
  }

  return exitCode;
}

Future<void> flavorize(HookContext context) async {
  'Flavorizing...'.log();

  for (var flavor in context.vars['flavors']) {
    switch (flavor) {
      case 'dev':
      case 'prod':
        break;
      default:
        await Process.run('cp', ['ic_launcher.png', 'ic_launcher_$flavor.png'],
            workingDirectory: '$name/assets/launcher_icons');
    }
  }

  var flavorizrProc = await Process.start(
      'flutter', ['pub', 'run', 'flutter_flavorizr'],
      workingDirectory: name);

  flavorizrProc.log();

  exitCode = await flavorizrProc.exitCode;

  if (exitCode == 0) {
    'Flavorized successfully'.log();

    for (var flavor in context.vars['flavors']) {
      await Process.run('mv', ['main_$flavor.gen.dart', 'main_$flavor.dart'],
          workingDirectory: '$name/lib/core/flavors');
      await Process.run('rm', ['main_$flavor.dart'],
          workingDirectory: '$name/lib');

      if (context.vars['platforms'].contains('ios')) {
        for (var run in ['Debug', 'Profile', 'Release']) {
          var file = await File('$name/ios/Flutter/${flavor}${run}.xcconfig');
          String content = await file.readAsString();
          var writer = file.openWrite();
          writer.write(content.replaceAll('lib/main_${flavor}.dart',
              'lib/core/flavors/main_${flavor}.dart'));
          await writer.flush();
          await writer.close();
        }
      }
    }

    await Process.run('rm', ['-r', 'pages'], workingDirectory: '$name/lib');
    await Process.run('rm', ['ic_launcher.png'],
        workingDirectory: '$name/assets/launcher_icons');
    await Process.run('rm', ['main_dart.xml'],
        workingDirectory: '$name/.idea/runConfigurations');
  } else {
    'Flavorizing failed with exit code $exitCode'.error();
  }
}

Future<void> correct(HookContext context) async {
  if (context.vars['platforms'].contains('android')) {
    File buildGradle = File('$name/android/app/build.gradle');
    String buildGradleContent = buildGradle.readAsStringSync();

    buildGradle.writeAsStringSync(buildGradleContent
        .replaceAll('compileSdkVersion flutter.compileSdkVersion',
            'compileSdkVersion 33')
        .replaceAll('minSdkVersion flutter.minSdkVersion', 'minSdkVersion 24'));
  }

  if (context.vars['platforms'].contains('ios')) {
    File iosPodFile = File('$name/ios/Podfile');
    String iosPodFileContent = iosPodFile.readAsStringSync();

    iosPodFile.writeAsStringSync(iosPodFileContent
        .replaceAll('# platform :ios, \'11.0\'', 'platform :ios, \'12.0\'')
        .replaceAll('flutter_additional_ios_build_settings(target)', '''
flutter_additional_ios_build_settings(target)
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end'''));

    File plistFile = File('$name/ios/Flutter/AppFrameworkInfo.plist');
    String plistFileContent = plistFile.readAsStringSync();

    plistFile.writeAsStringSync(
        plistFileContent.replaceAll('''  <key>MinimumOSVersion</key>
  <string>11.0</string>''', '''  <key>MinimumOSVersion</key>
  <string>12.0</string>'''));

    File xcodeWorkspaceFile =
        File('$name/ios/Runner.xcodeproj/project.pbxproj');
    List<String> xcodeWorkspaceFileContent =
        await xcodeWorkspaceFile.readAsLines();

    Future<String> mapIos() async {
      return xcodeWorkspaceFileContent
          .map((line) {
            if (line.contains('IPHONEOS_DEPLOYMENT_TARGET')) {
              line = '${line.substring(0, line.indexOf('= '))}= 12.0;';
            }
            return line;
          })
          .toList()
          .toRawString;
    }

    mapIos().then((result) async {
      xcodeWorkspaceFile.writeAsString(result);
    });
  }
}

Future<void> addSigning(HookContext context) async {
  // var chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  // String genPass = List.generate(20, (index) {
  //   return chars[(Random.secure().nextInt(chars.length))];
  // }).join();

  // 'Generated password: $genPass'.log();

  File signingFile = File('$name/android/app/signing/signing.properties');
  String signingFileContent = await signingFile.readAsString();
  var writer = signingFile.openWrite();
  writer.write(signingFileContent.replaceAll(
      '{signing_password}', context.vars['signing_password']));
  await writer.flush();
  await writer.close();

  File buildGradle = File('$name/android/app/build.gradle');
  String buildGradleContent = await buildGradle.readAsString();
  buildGradleContent += '''

Properties props = new Properties()
def propFile = file('./signing/signing.properties')
if (propFile.canRead()) {
    props.load(new FileInputStream(propFile))

    if (props != null && props.containsKey('STORE_FILE') && props.containsKey('STORE_PASSWORD') &&
            props.containsKey('KEY_ALIAS') && props.containsKey('KEY_PASSWORD')) {
        android.signingConfigs.signed.storeFile = file(props['STORE_FILE'])
        android.signingConfigs.signed.storePassword = props['STORE_PASSWORD']
        android.signingConfigs.signed.keyAlias = props['KEY_ALIAS']
        android.signingConfigs.signed.keyPassword = props['KEY_PASSWORD']
    } else {
        android.buildTypes.release.signingConfig = null
    }
} else {
    android.buildTypes.release.signingConfig = null
}''';

  writer = buildGradle.openWrite();
  writer.write(buildGradleContent.replaceAll(
    '''buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig signingConfigs.debug
        }
    }''',
    '''signingConfigs {
        signed
    }

    buildTypes {
        debug {
            signingConfig signingConfigs.signed
        }
        release {
            signingConfig signingConfigs.signed
        }
    }''',
  ));

  await writer.flush();
  await writer.close();

//   String keytoolCommand =
//       'keytool -genkey -v -keystore $name/android/app/signing/upload-keystore.jks -alias upload -keyalg RSA -keysize 2048 -validity 10000 -keypass $genPass -storepass $genPass';

//   var list = '{"1", "2", "3", "4", "5", "6", "yes"}';
//   if (withUI) {
//     list = '{"#", "#", "#", "#", "#", "#", "yes"}';
//     for (var value in context.vars['signingVars']) {
//       list = list.replaceFirst('#', value.toString());
//     }
//   }

//   var process = await Process.start('osascript', [
//     '-e',
//     '''tell application "Terminal"
//       do script "$keytoolCommand"
//       activate
//       end tell
//       set myList to ${list}
//       delay 3
//       repeat with str in myList
//       tell application "System Events"
// 	tell application process "Terminal"
// 		set frontmost to true
// 		keystroke str
// 		keystroke return
// 	end tell
// end tell
// end repeat
// delay 5
// // tell application "System Events"
// // 	tell application process "Terminal"
// // 		set frontmost to true
// // 		keystroke "q" using command down
// // 	end tell
// // end tell
// '''
//   ]);
  // return await process.exitCode;
}

void exitBrick() async {
  'Deleting project folder because of errors...'.error();
  var rmProcess = await Process.start('rm', ['-r', name]);
  var exitCode = await rmProcess.exitCode;

  if (exitCode == 0) {
    'Project deleted...'.log();
    'Complete with exit code: 1'.error();
  }

  exit(1);
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

extension ListToString on List<String> {
  String get toRawString {
    String result = '';

    for (String str in this) {
      result += '$str\n';
    }

    return result;
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