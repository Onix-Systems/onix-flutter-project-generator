import 'package:mason/mason.dart';
import 'dart:io';
import 'package:process_run/shell.dart';
import 'package:tint/tint.dart';
import 'dart:math';
import 'package:recase/recase.dart';

late String name;

void run(HookContext context) async {
  name = context.vars['project_name'].toString().toSnakeCase;

  if (!context.vars['platforms'].contains('android')) {
    await Process.run('rm', ['-rf', '$name/android']);
  }

  if (!context.vars['handLocalization']) {
    await Process.run('rm', ['app_en.arb'],
        workingDirectory: '$name/lib/app/localization/l10n');
  } else {
    await Process.run('rm', ['intl_en.arb'],
        workingDirectory: '$name/lib/app/localization/l10n');
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

  await Process.run('mv', ['main.gen.dart', 'main.dart'],
      workingDirectory: '$name/lib');

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

  var splashProcess = await Process.start(
      'flutter', ['pub', 'run', 'flutter_native_splash:create'],
      workingDirectory: name);

  splashProcess.log();

  int splashCode = await splashProcess.exitCode;

  exitCode += formatCode + sorterCode + splashCode;

  await correct(context);

  await Process.run('rm', ['widget_test.dart'], workingDirectory: '$name/test');

  var gitInitProcess =
      await Process.start('git', ['init'], workingDirectory: name);

  gitInitProcess.log();

  int gitCode = await gitInitProcess.exitCode;

  await secure(context);

  var gitAddProcess =
      await Process.start('git', ['add', '--all'], workingDirectory: name);

  gitAddProcess.log();

  int addCode = await gitAddProcess.exitCode;

  var gitCommitProcess = await Process.start('git', ['commit', '-m', 'Initial'],
      workingDirectory: name);

  gitCommitProcess.log();

  int gitCommitCode = await gitCommitProcess.exitCode;

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
    'fluttertoast',
    'flutter_native_splash',
    'collection',
    'flutter_dotenv',
    'flutter_jailbreak_detection',
    'gap',
  ];

  if (!context.vars['web_only']) {
    dependencies.add('flutter_screenutil');
    dependencies.add('loader_overlay');
  } else {
    dependencies.add('flutter_overlay_loader');
  }

  List<String> devDependencies = [
    'build_runner',
    'freezed',
    'json_serializable',
    'import_sorter',
    'mockito',
    'bloc_test',
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

  if (context.vars['handLocalization']) {
    await Process.run('dart', ['pub', 'global', 'activate', 'flutter_gen']);
  } else {
    dependencies.addAll(['intl', 'intl_utils']);
  }

  if (context.vars['graphql']) {
    dependencies.add('graphql');
  }

  if (context.vars['firebase_auth']) {
    dependencies.addAll(['firebase_core', 'firebase_auth']);
  } else {
    await removeFirebase(context);
  }

  'Getting dependencies...'.log();

  int exitCode = 0;

  var depProc = await Process.start('flutter', ['pub', 'add', ...dependencies],
      workingDirectory: name);

  depProc.log();

  exitCode = await depProc.exitCode;

  if (exitCode == 0) {
    'Dependencies installed successfully'.log();
  } else {
    'Failed to install dependencies... Exit code: $exitCode'.error();
    //exitBrick();
  }

  'Getting dev dependencies...'.log();

  var devDepProc = await Process.start(
      'flutter', ['pub', 'add', '-d', ...devDependencies],
      workingDirectory: name);

  devDepProc.log();

  exitCode = await devDepProc.exitCode;

  if (exitCode == 0) {
    'Dev dependencies installed successfully'.log();
  } else {
    'Failed to install dev dependencies... Exit code: $exitCode'.error();
    //exitBrick();
  }
}

Future<void> flavorize(HookContext context) async {
  'Flavorizing...'.log();
  await Directory('$name/flavor_assets').create(recursive: true);

  for (var flavor in context.vars['flavors']) {
    await Directory('$name/flavor_assets/$flavor/launcher_icons')
        .create(recursive: true);
    switch (flavor) {
      case 'dev':
      case 'prod':
        File srcFile =
            File('$name/assets/launcher_icons/ic_launcher_$flavor.png');
        await srcFile
            .copy('$name/flavor_assets/$flavor/launcher_icons/ic_launcher.png');
        await srcFile.delete();

        srcFile = File('$name/assets/android12splash_$flavor.png');
        await srcFile.copy('$name/flavor_assets/$flavor/android12splash.png');

        await srcFile.delete();
        break;
      default:
        File srcFile = File('$name/assets/launcher_icons/ic_launcher.png');
        await srcFile
            .copy('$name/flavor_assets/$flavor/launcher_icons/ic_launcher.png');
        if (flavor == context.vars['flavors'].last) {
          await srcFile.delete();
        }

        srcFile = File('$name/assets/android12splash.png');
        await srcFile.copy('$name/flavor_assets/$flavor/android12splash.png');

        if (flavor == context.vars['flavors'].last) {
          await srcFile.delete();
        }
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
      final makeFlavorFile =
          await File('$name/.idea/runConfigurations/make-${flavor}.xml')
              .create();

      final makeContent = '''
<component name="ProjectRunConfigurationManager">
    <configuration default="false" name="make-$flavor" type="MAKEFILE_TARGET_RUN_CONFIGURATION" factoryName="Makefile">
        <makefile filename="\$PROJECT_DIR\$/Makefile" target="$flavor" workingDirectory="" arguments="">
            <envs />
        </makefile>
        <method v="2" />
    </configuration>
</component>
      ''';

      await makeFlavorFile.writeAsString(makeContent);

      final makeFile = await File('$name/Makefile');

      final makeFileContent = await makeFile.readAsString();

      await makeFile.writeAsString('''
$makeFileContent
      
$flavor:
\t@echo "Building for $flavor"
\t@echo "Copying ${flavor}_assets to \$(ASSETS_DIR)"
\t@cp -r \$(ROOT_DIR)/flavor_assets/$flavor/* \$(ASSETS_DIR)
\tdart run flutter_native_splash:create
''');

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
    File appBuildGradle = File('$name/android/app/build.gradle');
    String appBuildGradleContent = appBuildGradle.readAsStringSync();

    appBuildGradle.writeAsStringSync(appBuildGradleContent
        .replaceAll('compileSdkVersion flutter.compileSdkVersion',
            'compileSdkVersion 34')
        .replaceAll('minSdkVersion flutter.minSdkVersion', 'minSdkVersion 22')
        .replaceAll('targetSdkVersion flutter.targetSdkVersion',
            'targetSdkVersion 34'));
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

    await xcodeWorkspaceFile.writeAsString(xcodeWorkspaceFileContent
        .map((line) {
          if (line.contains('IPHONEOS_DEPLOYMENT_TARGET')) {
            line = '${line.substring(0, line.indexOf('= '))}= 12.0;';
          }
          return line;
        })
        .toList()
        .toRawString);
  }
}

Future<void> secure(HookContext context) async {
  'Securing... !'.log();

  File globalGitIgnoreFile = File('$name/.gitignore');

  String globalGitIgnoreContent = await globalGitIgnoreFile.readAsString();

  globalGitIgnoreFile.writeAsStringSync(globalGitIgnoreContent +
      '''

# Secure
*.jks
.env
ios/firebase_app_id_file.json
android/app/google-services.json
lib/firebase_options.dart
ios/Runner/GoogleService-Info.plist

# Ignore lcov.info
coverage/

''');

  if (context.vars['platforms'].contains('android')) {
    File androidGitIgnoreFile = File('$name/android/.gitignore');

    String androidGitIgnoreContent = await androidGitIgnoreFile.readAsString();

    androidGitIgnoreFile.writeAsStringSync(androidGitIgnoreContent +
        '''
      
/app/signing/signing.properties
      ''');

    File androidBuildGradleFile = File('$name/android/app/build.gradle');

    String androidBuildGradleContent =
        await androidBuildGradleFile.readAsString();

    androidBuildGradleFile.writeAsStringSync(
        androidBuildGradleContent.replaceFirst('android {', '''

\/\/ if need to use google maps - add google.maps_api_key=SECRET_KEY to local.properties
\/\/def googleMapsApiKey = localProperties.getProperty('google.maps_api_key')
      
android {'''));

    File androidManifestFile =
        File('$name/android/app/src/main/AndroidManifest.xml');

    String androidManifestContent = await androidManifestFile.readAsString();

    androidManifestFile.writeAsStringSync(
        androidManifestContent.replaceFirst('</application>', '''
      
      \<!-- If need too use google maps - uncoment
       <meta-data
            android:name="com.google.android.geo.API_KEY"
            android:value="\${googleMapsApiKey}" />-->

      </application>'''));
  }
}

Future<void> removeFirebase(HookContext context) async {
  await Process.run('rm', ['-r', 'data/source/remote/firebase'],
      workingDirectory: '$name/lib');
  await Process.run('rm', ['-r', 'app/service/firebase_session_service'],
      workingDirectory: '$name/lib');
  await Process.run('rm', ['-r', 'domain/params'],
      workingDirectory: '$name/lib');
  await Process.run(
      'rm', ['-r', 'data/repository/firebase_auth_repository_impl.dart'],
      workingDirectory: '$name/lib');
  await Process.run(
      'rm', ['-r', 'domain/repository/firebase_auth_repository.dart'],
      workingDirectory: '$name/lib');
  await Process.run('rm', ['-r', 'domain/usecase/create_account_use_case.dart'],
      workingDirectory: '$name/lib');
  await Process.run('rm', ['-r', 'domain/usecase/log_out_use_case.dart'],
      workingDirectory: '$name/lib');
  await Process.run('rm', ['-r', 'domain/usecase/login_use_case.dart'],
      workingDirectory: '$name/lib');
  await Process.run(
      'rm', ['-r', 'core/arch/domain/entity/failure/firebase_failure.dart'],
      workingDirectory: '$name/lib');

  final firebaseArbStrings = ''',
  "firebaseInvalidEmail": "Please provide a valid Email address.",
  "firebaseAccountDisabled": "Your account was disabled. Please contact support.",
  "firebaseUserNotRegistered": "This user does not exist.",
  "firebasePasswordIncorrect": "Password is incorrect.",
  "firebaseAccountAlreadyRegistered": "Account already registered.",
  "firebaseNotAllowed": "Check is email authorization enabled on your Firebase account.",
  "firebaseWeakPassword": "Your password is too weak.",
  "firebaseCantFetch": "Can't fetch User Profile.",
  "firebaseLogOutFailed": "Log Out failed."''';

  File arbFile = context.vars['handLocalization']
      ? File('$name/lib/app/localization/l10n/app_en.arb')
      : File('$name/lib/app/localization/l10n/intl_en.arb');

  String arbContent = await arbFile.readAsString();

  arbFile.writeAsStringSync(arbContent.replaceFirst(firebaseArbStrings, ''));
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
    print('{#info}$this');
  }

  void error() {
    print('{#error}$this');
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
