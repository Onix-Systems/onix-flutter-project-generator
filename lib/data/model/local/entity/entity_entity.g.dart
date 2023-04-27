// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityEntity _$EntityEntityFromJson(Map<String, dynamic> json) => EntityEntity(
      name: json['name'] as String,
      generateRequest: json['generateRequest'] as bool? ?? false,
      generateResponse: json['generateResponse'] as bool? ?? false,
      exists: json['exists'] as bool? ?? false,
      classBody: json['classBody'] as String?,
    );

Map<String, dynamic> _$EntityEntityToJson(EntityEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'generateRequest': instance.generateRequest,
      'generateResponse': instance.generateResponse,
      'exists': instance.exists,
      'classBody': instance.classBody,
    };
