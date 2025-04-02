import 'dart:convert';
import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:recase/recase.dart';

extension ConfigFileExtension on Config {
  Future<File> saveJsonConfig({
    required File file,
    required List<String> flavors,
    required String signingPassword,
  }) {
    final configContent = jsonEncode(
      {
        'signing_password': signingPassword,
        'project_name_dirt': projectName,
        'project_org': organization,
        'flavorizr': flavorize,
        'flavors': flavors.toList(),
        'navigation': router.name,
        'localization': localization.name.snakeCase,
        'use_keytool': generateSigningKey,
        'use_sonar': useSonar,
        'graphql': graphql,
        'firebase_auth': firebaseAuth,
        'platforms': platformsList.toString().replaceAll(' ', ''),
        'theme_generate': theming.name == 'themeTailor',
        'branch': branchConfig.branch,
        'screen_util': useScreenUtil,
        'state_management': stateManager.name,
        'sentry': sentry,
      },
    );
    return file.writeAsString(configContent);
  }
}
