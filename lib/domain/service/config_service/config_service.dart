import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/core/di/source.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/util/extension/flavor_extension.dart';
import 'package:recase/recase.dart';

class ConfigService {
  Config config = Config.empty();

  void resetConfig() {
    config = Config.empty().copyWith(
      branchConfig: config.branchConfig,
    );
  }

  Future<void> saveConfig({required String projectPath}) async {
    await configSource.saveConfig(
      config: config.copyWith(
        screens: screenRepository.screens.map((screen) {
          screen.exists = true;
          return screen;
        }).toSet(),
      ),
      configPath: '$projectPath/.gen_config.json',
    );
  }

  Future<File> saveJsonConfig({
    required File file,
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
        'branch': config.branchConfig.branch,
        'screen_util': config.useScreenUtil,
        'state_management': config.stateManager.name,
        'sentry': config.sentry,
      },
    );
    return file.writeAsString(configContent);
  }

  String getSigningPassword({bool ignoreSetting = false}) {
    if (!config.generateSigningKey && !ignoreSetting) {
      return '';
    }
    if (config.signingVars[6].isEmpty) {
      return List.generate(20, (index) {
        return AppConsts.signingKeyPassChars[
            Random.secure().nextInt(AppConsts.signingKeyPassChars.length)];
      }).join();
    } else {
      return config.signingVars[6];
    }
  }

  Set<String> getFlavorsAsSet() {
    if (config.flavors.isEmpty) {
      return {};
    }
    final output = config.flavors.flavorStringToSet();

    for (final flavor in output) {
      if (flavor.isEmpty || flavor == ' ') {
        output.remove(flavor);
      }
    }

    output
      ..remove('dev')
      ..remove('prod');
    return output;
  }
}
