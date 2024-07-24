import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/fastlane_service/utils/fastlane_makefile_util.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:onix_flutter_bricks/util/makefile/makefile_base.dart';
import 'package:onix_flutter_bricks/util/makefile/makefile_content.dart';
import 'package:onix_flutter_bricks/util/makefile/makefile_line.dart';

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
          // (Ivan Modlo): The offset at the end of "flavor:$flavor "
          // is the delimiter for the command. As a temporary solution
          final lineFlavor = flavors.isNotEmpty ? 'flavor:$flavor ' : '';

          final makefile = MakefileContent(
            commands: [
              MakefileLine(
                name: 'build_android${lineName}apk',
                commands: [
                  '@echo "Build Android APK"',
                  '@flutter build apk --release $buildFlavor $mainDart',
                ],
              ),
              MakefileLine(
                name: 'build_android${lineName}aab',
                commands: [
                  '@echo "Build Android AAB"',
                  '@flutter build appbundle --release $buildFlavor $mainDart',
                ],
              ),
              MakefileLine(
                name: 'build_android${lineName}with_distribution',
                args:
                    'build_android${lineName}firebase_only build_android${lineName}store_only',
                commands: [],
              ),
              MakefileLine(
                name: 'build_android${lineName}firebase_only',
                args: 'build_android${lineName}apk',
                commands: [
                  '@echo "Distributing"',
                  '@cd android && bundle exec fastlane build ${lineFlavor}firebase:true artifact_type:apk $env',
                ],
              ),
              MakefileLine(
                name: 'build_android${lineName}store_only',
                args: 'build_android${lineName}aab',
                commands: [
                  '@echo "Distributing"',
                  '@cd android && bundle exec fastlane build ${lineFlavor}store:true artifact_type:aab $env',
                ],
              ),
            ],
          );

          contents.addAll(makefile.convertCommandsToListString());
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
          // (Ivan Modlo): The offset at the end of "flavor:$flavor "
          // is the delimiter for the command. As a temporary solution
          final lineFlavor = flavors.isNotEmpty ? 'flavor:$flavor ' : '';

          final makefile = MakefileContent(
            commands: [
              MakefileLine(
                name: 'build${lineName}ios',
                commands: [
                  '@echo "Building"',
                  '@flutter build ios --release $buildFlavor $mainDart',
                ],
              ),
              MakefileLine(
                name: 'build_ios${lineName}with_distribution',
                args: 'build${lineName}ios',
                commands: [
                  '@cd ios && bundle exec fastlane build ${lineFlavor}firebase:true test_flight:true $env',
                ],
              ),
              MakefileLine(
                name: 'build_ios${lineName}firebase_only',
                args: 'build${lineName}ios',
                commands: [
                  '@echo "Distributing to the Firebase App Distribution"',
                  '@cd ios && bundle exec fastlane build ${lineFlavor}firebase:true $env',
                ],
              ),
              MakefileLine(
                name: 'build_ios${lineName}test_flight_only',
                args: 'build${lineName}ios',
                commands: [
                  '@echo "Distributing to the TestFlight"',
                  '@cd ios && bundle exec fastlane build ${lineFlavor}test_flight:true',
                ],
              ),
            ],
          );

          contents.addAll(makefile.convertCommandsToListString());
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
    final commands = <MakefileBase>[];

    if (flavors.isEmpty) {
      copiedFlavors.add('default');
    }

    if (!contents.contains('clean:')) {
      if (contents.isNotEmpty) {
        contents.addNewLine();
      }

      commands.add(
        const MakefileLine(
          name: 'clean',
          commands: [
            '@echo "Cleaning"',
            '@flutter clean',
          ],
        ),
      );
    }

    for (final flavor in copiedFlavors) {
      final lineName = flavors.isNotEmpty ? '_$flavor' : '';
      final commandLines = <String>[];
      for (final platform in platforms) {
        final platformWithFlavor =
            flavors.isNotEmpty ? '_${platform}_${flavor}_' : '_${platform}_';

        commandLines.add(
          '@make build${platformWithFlavor}with_distribution -f Makefile_$platform.mk',
        );
      }

      commands.add(
        MakefileLine(
          name: 'build_and_distribute$lineName: clean',
          commands: commandLines,
        ),
      );
    }

    contents.addAll(
      MakefileContent(commands: commands).convertCommandsToListString(),
    );

    await file.writeAsString(contents.join('\n'));
  }
}
