import 'package:onix_flutter_bricks/app/app_consts.dart';

class FlavorsUtil {
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

  const FlavorsUtil._();
}
