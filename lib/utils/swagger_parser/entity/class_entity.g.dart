// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassEntity _$ClassEntityFromJson(Map<String, dynamic> json) => ClassEntity(
      name: json['name'] as String,
      properties: (json['properties'] as List<dynamic>)
          .map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassEntityToJson(ClassEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'properties': instance.properties,
    };
