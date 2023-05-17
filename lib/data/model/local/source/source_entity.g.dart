// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceEntity _$SourceEntityFromJson(Map<String, dynamic> json) => SourceEntity(
      name: json['name'] as String,
      entities: (json['entities'] as List<dynamic>)
          .map((e) => EntityWrapper.fromJson(e as Map<String, dynamic>))
          .toList(),
      exists: json['exists'] as bool? ?? false,
    );

Map<String, dynamic> _$SourceEntityToJson(SourceEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'entities': instance.entities,
      'exists': instance.exists,
    };
