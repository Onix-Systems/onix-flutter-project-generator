import 'dart:math';

import 'package:onix_flutter_bricks/core/app/app_consts.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/util/extension/flavor_extension.dart';

extension ProjectConfigExtension on Config {
  String getSigningPassword() {
    if (!generateSigningKey) {
      return '';
    }
    if (signingVars[6].isEmpty) {
      return List.generate(20, (index) {
        return AppConsts.signingKeyPassChars[
            (Random.secure().nextInt(AppConsts.signingKeyPassChars.length))];
      }).join();
    } else {
      return signingVars[6];
    }
  }

  Set<String> getFlavorsAsSet() {
    if (flavors.isEmpty) {
      return {};
    }
    var output = flavors.flavorStringToSet();

    for (var flavor in output) {
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
