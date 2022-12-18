import 'package:freezed_annotation/freezed_annotation.dart';

part 'platforms_list.freezed.dart';

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

  @override
  String toString() {
    return '${android ? 'android' : ''}${ios ? ',ios' : ''}${web ? ',web' : ''}${macos ? ',macos' : ''}${windows ? ',windows' : ''}${linux ? ',linux' : ''}';
  }
}
