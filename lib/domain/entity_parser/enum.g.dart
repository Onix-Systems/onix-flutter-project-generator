// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnumEntity _$EnumEntityFromJson(Map<String, dynamic> json) => EnumEntity(
      name: json['name'] as String,
      properties: (json['properties'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    )..sourceName = json['sourceName'] as String;

Map<String, dynamic> _$EnumEntityToJson(EnumEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'properties': instance.properties,
      'sourceName': instance.sourceName,
    };
