import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/core/di/source.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/config/branch_config.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/platforms_list/platforms_list.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/domain/entity/state_management/project_state_manager.dart';
import 'package:onix_flutter_bricks/util/enum/project_localization.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:onix_flutter_bricks/util/enum/project_theming.dart';
import 'package:onix_flutter_bricks/util/extension/flavor_extension.dart';
import 'package:recase/recase.dart';

class ConfigService {
  Config _config = Config.empty();

  Config get config => _config;

  void updateWith({
    Config? newConfig,
    BranchConfig? branchConfig,
    ArchType? arch,
    String? projectPath,
    String? projectName,
    bool? projectExists,
    String? organization,
    PlatformsList? platformsList,
    ProjectStateManager? stateManager,
    bool? flavorize,
    String? flavors,
    bool? generateSigningKey,
    bool? firebaseAuth,
    bool? useSonar,
    bool? graphql,
    bool? screenUtil,
    ProjectRouter? router,
    ProjectLocalization? localization,
    ProjectTheming? theming,
    List<String>? signingVars,
    Set<Screen>? screens,
    List<AppStyle>? styles,
    String? swaggerUrl,
    bool? sentry,
  }) {
    if (newConfig != null) {
      _config = newConfig;
    }

    _config = _config.copyWith(
      branchConfig: branchConfig ?? _config.branchConfig,
      arch: arch ?? _config.arch,
      projectPath: projectPath ?? _config.projectPath,
      projectName: projectName ?? _config.projectName,
      projectExists: projectExists ?? _config.projectExists,
      organization: organization ?? _config.organization,
      platformsList: platformsList ?? _config.platformsList,
      stateManager: stateManager ?? _config.stateManager,
      flavorize: flavorize ?? _config.flavorize,
      flavors: flavors ?? _config.flavors,
      generateSigningKey: generateSigningKey ?? _config.generateSigningKey,
      firebaseAuth: firebaseAuth ?? _config.firebaseAuth,
      useSonar: useSonar ?? _config.useSonar,
      graphql: graphql ?? _config.graphql,
      screenUtil: screenUtil ?? _config.screenUtil,
      router: router ?? _config.router,
      localization: localization ?? _config.localization,
      theming: theming ?? _config.theming,
      signingVars: signingVars ?? _config.signingVars,
      screens: screens ?? _config.screens,
      styles: styles ?? _config.styles,
      swaggerUrl: swaggerUrl ?? _config.swaggerUrl,
      sentry: sentry ?? _config.sentry,
    );
  }

  void resetConfig() {
    _config = Config.empty().copyWith(
      branchConfig: config.branchConfig,
    );
  }

  Future<void> saveConfigFile({required String projectPath}) async {
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
    if (config.signingVars.last.isEmpty) {
      return List.generate(20, (index) {
        return AppConsts.signingKeyPassChars[
            Random.secure().nextInt(AppConsts.signingKeyPassChars.length)];
      }).join();
    } else {
      return config.signingVars.last;
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
