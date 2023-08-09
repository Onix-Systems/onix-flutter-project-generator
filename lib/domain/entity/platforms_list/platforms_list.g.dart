// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platforms_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlatformsList _$$_PlatformsListFromJson(Map<String, dynamic> json) =>
    _$_PlatformsList(
      android: json['android'] as bool? ?? true,
      ios: json['ios'] as bool? ?? true,
      web: json['web'] as bool? ?? false,
      macos: json['macos'] as bool? ?? false,
      windows: json['windows'] as bool? ?? false,
      linux: json['linux'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PlatformsListToJson(_$_PlatformsList instance) =>
    <String, dynamic>{
      'android': instance.android,
      'ios': instance.ios,
      'web': instance.web,
      'macos': instance.macos,
      'windows': instance.windows,
      'linux': instance.linux,
    };
