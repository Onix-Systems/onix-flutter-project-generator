// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Config _$$_ConfigFromJson(Map<String, dynamic> json) => _$_Config(
      sources: (json['sources'] as List<dynamic>)
          .map((e) => SourceEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      screens: (json['screens'] as List<dynamic>)
          .map((e) => ScreenEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      entities: (json['entities'] as List<dynamic>)
          .map((e) => EntityWrapper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ConfigToJson(_$_Config instance) => <String, dynamic>{
      'sources': instance.sources,
      'screens': instance.screens,
      'entities': instance.entities,
    };
