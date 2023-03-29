// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenEntity _$ScreenEntityFromJson(Map<String, dynamic> json) => ScreenEntity(
      name: json['name'] as String,
      bloc: json['bloc'] as bool? ?? false,
      exists: json['exists'] as bool? ?? false,
    );

Map<String, dynamic> _$ScreenEntityToJson(ScreenEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bloc': instance.bloc,
      'exists': instance.exists,
    };
