import 'package:onix_flutter_bricks/core/app/app_consts.dart';

typedef FastlaneMakefileParams = void Function(
  String flavor,
  String mainDartPath,
  String lineName,
  String env,
);

abstract final class FastlaneMakefileUtil {
  static void generate({
    required bool flavorsIsNotEmpty,
    required String flavor,
    required FastlaneMakefileParams onCreate,
  }) {
    final lineName = flavorsIsNotEmpty ? '_${flavor}_' : '_';
    final buildFlavor = flavorsIsNotEmpty ? '--flavor $flavor' : '';
    final mainDart = flavorsIsNotEmpty
        ? '-t ${AppConsts.mainDartPath}main_$flavor.dart'
        : '';
    final envParam = flavorsIsNotEmpty ? '--env $flavor' : '';

    onCreate(buildFlavor, mainDart, lineName, envParam);
  }
}
