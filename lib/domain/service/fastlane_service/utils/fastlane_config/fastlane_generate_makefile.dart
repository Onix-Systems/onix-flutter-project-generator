abstract class FastlaneGenerateMakefile {
  const FastlaneGenerateMakefile._();

  static List<String> generateForAndroid({String flavor = ''}) {
    final makefileLineName = flavor.isNotEmpty ? '_${flavor}_' : '_';
    final flavorParam = flavor.isNotEmpty ? '--flavor $flavor' : '';
    final mainFilePath =
        flavor.isNotEmpty ? '-t lib/core/flavors/main_$flavor.dart' : '';

    final envParam = flavor.isNotEmpty ? '--env $flavor' : '';
    final fastlaneFlavor = flavor.isNotEmpty ? flavor : 'default';
    final list = <String>[];

    list
      ..add('build_android${makefileLineName}apk: clean')
      ..add('\techo "Build and distribute android APK"')
      ..add('\t@flutter build apk --release $flavorParam $mainFilePath')
      ..add(
        '\t@cd android && bundle exec fastlane build flavor:$fastlaneFlavor firebase:true artifact_type:apk flavor:$fastlaneFlavor $envParam',
      )
      ..add('')
      ..add('build_android${makefileLineName}aab: clean')
      ..add('\t@echo "Build and distribute android AAB"')
      ..add('\t@flutter build appbundle --release $flavorParam $mainFilePath')
      ..add(
        '\t@cd android && bundle exec fastlane build flavor:$fastlaneFlavor store:true artifact_type:aab flavor:$fastlaneFlavor $envParam',
      )
      ..add('')
      ..add(
        'build_android${makefileLineName}with_distribution: build_android${makefileLineName}apk build_android${makefileLineName}aab',
      )
      ..add(
        '\t@echo "Build and distribute to the Firebase App Distribution and Store"',
      )
      ..add('')
      ..add(
          'build_android${makefileLineName}firebase_only: build_android${makefileLineName}apk')
      ..add('\t@echo "Build and distribute to the Firebase App Distribution"')
      ..add('')
      ..add(
        'build_android${makefileLineName}store_only: build_android${makefileLineName}aab',
      )
      ..add('\t@echo "Build and distribute to the Play Store"')
      ..add('');

    return list;
  }

  static List<String> generateForIos({String flavor = ''}) {
    final makefileLineName = flavor.isNotEmpty ? '_${flavor}_' : '_';
    final flavorParam = flavor.isNotEmpty ? '--flavor $flavor' : '';
    final mainFilePath =
        flavor.isNotEmpty ? '-t lib/core/flavors/main_$flavor.dart' : '';
    final envParam = flavor.isNotEmpty ? '--env $flavor' : '';
    final fastlaneFlavor = flavor.isNotEmpty ? flavor : 'default';
    final list = <String>[];

    list
      ..add('build${makefileLineName}ios:')
      ..add('\t@flutter build ios --release $flavorParam $mainFilePath')
      ..add('')
      ..add(
          'build_ios${makefileLineName}with_distribution: clean build${makefileLineName}ios')
      ..add(
        '\t@echo "Build and distribute iOS to the TestFlight and Firebase App Distribution"',
      )
      ..add(
        '\t@cd ios && bundle exec fastlane build flavor:$fastlaneFlavor firebase:true test_flight:true $envParam',
      )
      ..add('')
      ..add(
          'build_ios${makefileLineName}firebase_only: clean build${makefileLineName}ios')
      ..add(
        '\t@echo "Build and distribute iOS to the Firebase App Distribution"',
      )
      ..add(
        '\t@cd ios && bundle exec fastlane build flavor:$fastlaneFlavor firebase:true $envParam',
      )
      ..add('')
      ..add(
        'build_ios${makefileLineName}test_flight_only: clean build${makefileLineName}ios',
      )
      ..add(
        '\t@echo "Build and distribute iOS to the TestFlight"',
      )
      ..add(
        '\t@cd ios && bundle exec fastlane build flavor:$fastlaneFlavor test_flight:true $envParam',
      )
      ..add('');

    return list;
  }
}
