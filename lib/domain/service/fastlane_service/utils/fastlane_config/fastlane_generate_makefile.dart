import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/fastlane_service/utils/fastlane_makefile_util.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';

abstract final class FastlaneGenerateMakefile {
  static Future<void> generateMakefileAndroid({
    required String outputPath,
    required Iterable<String> flavors,
  }) async {
    final file = await File('$outputPath/Makefile_android.mk').create();
    final contents = <String>[];
    final copiedFlavors = List<String>.from(flavors);

    if (flavors.isEmpty) {
      copiedFlavors.add('default');
    }

    for (final flavor in copiedFlavors) {
      FastlaneMakefileUtil.generate(
        flavorsIsNotEmpty: flavors.isNotEmpty,
        flavor: flavor,
        onCreate: (buildFlavor, mainDart, lineName, env) {
          contents
            ..add('build_android${lineName}apk:')
            ..add('\t@echo "Build Android APK"')
            ..add('\t@flutter build apk --release $buildFlavor $mainDart')
            ..addNewLine()
            ..add('build_android${lineName}aab:')
            ..add('\t@echo "Build Android AAB"')
            ..add('\t@flutter build appbundle --release $buildFlavor $mainDart')
            ..addNewLine()
            ..add(
              'build_android${lineName}with_distribution: build_android${lineName}firebase_only build_android${lineName}store_only',
            )
            ..add(
              '\t@echo "Distributing"',
            )
            ..addNewLine()
            ..add(
                'build_android${lineName}firebase_only: build_android${lineName}apk')
            ..add(
                '\t@echo "Distributing"')
            ..add(
              '\t@cd android && bundle exec fastlane build flavor:$flavor firebase:true artifact_type:apk $env',
            )
            ..addNewLine()
            ..add(
              'build_android${lineName}store_only: build_android${lineName}aab',
            )
            ..add('\t@echo "Distributing"')
            ..add(
              '\t@cd android && bundle exec fastlane build flavor:$flavor firebase:true artifact_type:aab $env',
            )
            ..addNewLine();
        },
      );
    }

    await file.writeAsString(contents.join('\n'));
  }

  static Future<void> generateMakefileIos({
    required String outputPath,
    required Iterable<String> flavors,
  }) async {
    final file = await File('$outputPath/Makefile_ios.mk').create();
    final contents = <String>[];
    final copiedFlavors = List<String>.from(flavors);

    if (flavors.isEmpty) {
      copiedFlavors.add('default');
    }

    for (final flavor in copiedFlavors) {
      FastlaneMakefileUtil.generate(
        flavorsIsNotEmpty: flavors.isNotEmpty,
        flavor: flavor,
        onCreate: (buildFlavor, mainDart, lineName, env) {
          contents
            ..add('build${lineName}ios:')
            ..add('\t@flutter build ios --release $buildFlavor $mainDart')
            ..addNewLine()
            ..add('build_ios${lineName}with_distribution: build${lineName}ios')
            ..add(
              '\t@echo "Build and distribute iOS to the TestFlight and Firebase App Distribution"',
            )
            ..add(
              '\t@cd ios && bundle exec fastlane build flavor:$flavor firebase:true test_flight:true $env',
            )
            ..addNewLine()
            ..add('build_ios${lineName}firebase_only: build${lineName}ios')
            ..add(
              '\t@echo "Build and distribute iOS to the Firebase App Distribution"',
            )
            ..add(
              '\t@cd ios && bundle exec fastlane build flavor:$flavor firebase:true $env',
            )
            ..addNewLine()
            ..add(
              'build_ios${lineName}test_flight_only: build${lineName}ios',
            )
            ..add(
              '\t@echo "Build and distribute iOS to the TestFlight"',
            )
            ..add(
              '\t@cd ios && bundle exec fastlane build flavor:$flavor test_flight:true',
            )
            ..addNewLine();
        },
      );
    }

    await file.writeAsString(contents.join('\n'));
  }

  static Future<void> generateMakefileMain({
    required String outputPath,
    required Iterable<String> flavors,
    required Iterable<String> platforms,
  }) async {
    final file = await File('$outputPath/Makefile').create();
    final contents = await file.readAsLines();
    final copiedFlavors = List<String>.from(flavors);

    if (flavors.isEmpty) {
      copiedFlavors.add('default');
    }

    if (!contents.contains('clean:')) {
      contents
        ..addNewLine()
        ..add('clean:')
        ..add('\t@echo "Cleaning"')
        ..add('\t@flutter clean')
        ..addNewLine();
    }

    for (final flavor in copiedFlavors) {
      final lineName = flavors.isNotEmpty ? '_$flavor' : '';
      contents.add('build_and_distribute$lineName: clean');

      for (final platform in platforms) {
        final platformWithFlavor =
            flavors.isNotEmpty ? '_${platform}_${flavor}_' : '_${platform}_';

        contents.add(
          '\t@make build${platformWithFlavor}with_distribution -f Makefile_$platform.mk',
        );
      }

      contents.addNewLine();
    }

    await file.writeAsString(contents.join('\n'));
  }
}
