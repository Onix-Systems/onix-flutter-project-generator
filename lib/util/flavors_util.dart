import 'package:onix_flutter_bricks/core/app/app_consts.dart';

abstract final class FlavorsUtil {
  static Set<String> joinFlavors({
    required bool flavorize,
    required String selectedFlavors,
  }) {
    final flavors = <String>{};

    if (flavorize) {
      flavors.addAll(AppConsts.defaultFlavors);
      if (selectedFlavors.isNotEmpty) {
        flavors.addAll(selectedFlavors.trim().split(' '));
      }
    }

    return flavors;
  }
}
