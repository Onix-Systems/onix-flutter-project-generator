// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataComponent _$DataComponentFromJson(Map<String, dynamic> json) =>
    DataComponent(
      name: json['name'] as String,
      properties: (json['properties'] as List<dynamic>)
          .map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
      isEnum: json['isEnum'] as bool? ?? false,
      generateRequest: json['generateRequest'] as bool? ?? false,
      generateResponse: json['generateResponse'] as bool? ?? false,
      exists: json['exists'] as bool? ?? false,
      isGenerated: json['isGenerated'] as bool? ?? true,
    )..sourceName = json['sourceName'] as String;

Map<String, dynamic> _$DataComponentToJson(DataComponent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'generateRequest': instance.generateRequest,
      'generateResponse': instance.generateResponse,
      'exists': instance.exists,
      'isGenerated': instance.isGenerated,
      'properties': instance.properties,
      'sourceName': instance.sourceName,
      'isEnum': instance.isEnum,
    };
