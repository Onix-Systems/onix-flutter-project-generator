import 'dart:convert';
import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:recase/recase.dart';

extension ConfigFileExtension on File {
  Future<File> saveJsonConfig({
    required Config config,
    required List<String> flavors,
    required String signingPassword,
  }) {
    final configContent = jsonEncode(
      {
        'signing_password': signingPassword,
        'project_name_dirt': config.projectName,
        'project_org': config.organization,
        'flavorizr': config.flavorize,
        'flavors': flavors.toList(),
        'navigation': config.router.name,
        'localization': config.localization.name.snakeCase,
        'use_keytool': config.generateSigningKey,
        'use_sonar': config.useSonar,
        'graphql': config.graphql,
        'firebase_auth': config.firebaseAuth,
        'platforms': config.platformsList.toString().replaceAll(' ', ''),
        'theme_generate': config.theming.name == 'themeTailor',
        'branch': config.branch,
      },
    );
    return writeAsString(configContent);
  }
}
