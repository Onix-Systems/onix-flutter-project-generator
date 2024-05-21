import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/platforms_list/platforms_list.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/platforms_screen.dart';

part 'platforms_screen_models.freezed.dart';

@freezed
class PlatformsScreenEvent with _$PlatformsScreenEvent {
  const factory PlatformsScreenEvent.init({
    required Config config,
  }) = PlatformsScreenEventInit;

  const factory PlatformsScreenEvent.onPlatformsChange({
    required AvailablePlatforms item,
  }) = PlatformsScreenEventOnPlatformsChange;
}

class PlatformsScreenSR {}

@freezed
class PlatformsScreenState with _$PlatformsScreenState {
  const factory PlatformsScreenState({
    required Config config,
  }) = _PlatformsScreenStateData;
}

enum AvailablePlatforms {
  mobile(name: 'Mobile', asset: 'assets/platform_logo/mobile_logo.svg'),
  web(name: 'Web', asset: 'assets/platform_logo/www_logo.svg'),
  windows(name: 'Windows', asset: 'assets/platform_logo/win_logo.svg'),
  macos(name: 'MacOS', asset: 'assets/platform_logo/macos_logo.svg'),
  linux(name: 'Linux', asset: 'assets/platform_logo/linux_logo.svg');

  final String name;
  final String asset;

  const AvailablePlatforms({required this.name, required this.asset});
}
