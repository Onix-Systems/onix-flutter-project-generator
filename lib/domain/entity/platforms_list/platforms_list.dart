import 'package:freezed_annotation/freezed_annotation.dart';

part 'platforms_list.freezed.dart';
part 'platforms_list.g.dart';

@freezed
class PlatformsList with _$PlatformsList {
  const PlatformsList._();

  const factory PlatformsList({
    @Default(true) bool android,
    @Default(true) bool ios,
    @Default(false) bool web,
    @Default(false) bool macos,
    @Default(false) bool windows,
    @Default(false) bool linux,
  }) = _PlatformsList;

  bool get selected => android || ios || web || macos || windows || linux;

  bool get webOnly => web && !android && !ios && !macos && !windows && !linux;

  bool get mobile => android || ios;

  List<String> asList() {
    List<String> platforms = [];

    if (android) platforms.add('android');
    if (ios) platforms.add('ios');
    if (web) platforms.add('web');
    if (macos) platforms.add('macos');
    if (windows) platforms.add('windows');
    if (linux) platforms.add('linux');
    return platforms;
  }

  List<String> asPlatformCommandsList() {
    List<String> commands = [];

    if (android) {
      commands.add('apk');
      commands.add('appbundle');
    }
    if (ios) commands.add('ios');
    if (web) commands.add('web');
    if (macos) commands.add('macos');
    if (windows) commands.add('windows');
    if (linux) commands.add('linux');
    return commands;
  }

  @override
  String toString() {
    final platforms = asList();
    return platforms.join(', ');
  }

  factory PlatformsList.fromJson(Map<String, dynamic> json) =>
      _$PlatformsListFromJson(json);
}
