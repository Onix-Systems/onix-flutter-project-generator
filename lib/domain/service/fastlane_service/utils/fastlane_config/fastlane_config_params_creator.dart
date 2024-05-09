import 'package:onix_flutter_bricks/domain/service/fastlane_service/utils/fastlane_config/fatlane_config_param.dart';

class FastlaneFlavorParams {
  static List<String> createFastlaneParams({
    required String flavor,
    required String platform,
    required List<FastlaneConfigParam> params,
  }) {
    margin(int length) => ' '.padLeft(length);

    final list = <String>[
      '${margin(4)}- name: $flavor',
    ];

    for (final param in params) {
      final commentSign = param.shouldBeCommented ? '#' : '';

      list.addAll(
        param.toList().map((e) => '$commentSign${margin(6)}$e'),
      );
    }

    return list;
  }
}
