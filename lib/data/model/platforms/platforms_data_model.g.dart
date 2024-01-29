// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platforms_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlatformsDataModel _$PlatformsDataModelFromJson(Map<String, dynamic> json) =>
    PlatformsDataModel(
      android: json['android'] as bool?,
      iOS: json['iOS'] as bool?,
      web: json['web'] as bool?,
      macOS: json['macOS'] as bool?,
      windows: json['windows'] as bool?,
      linux: json['linux'] as bool?,
    );

Map<String, dynamic> _$PlatformsDataModelToJson(PlatformsDataModel instance) =>
    <String, dynamic>{
      'android': instance.android,
      'iOS': instance.iOS,
      'web': instance.web,
      'macOS': instance.macOS,
      'windows': instance.windows,
      'linux': instance.linux,
    };
