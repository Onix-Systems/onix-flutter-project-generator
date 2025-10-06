// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platforms_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlatformsList _$PlatformsListFromJson(Map<String, dynamic> json) =>
    _PlatformsList(
      android: json['android'] as bool? ?? true,
      ios: json['ios'] as bool? ?? true,
      web: json['web'] as bool? ?? false,
      macos: json['macos'] as bool? ?? false,
      windows: json['windows'] as bool? ?? false,
      linux: json['linux'] as bool? ?? false,
    );

Map<String, dynamic> _$PlatformsListToJson(_PlatformsList instance) =>
    <String, dynamic>{
      'android': instance.android,
      'ios': instance.ios,
      'web': instance.web,
      'macos': instance.macos,
      'windows': instance.windows,
      'linux': instance.linux,
    };
