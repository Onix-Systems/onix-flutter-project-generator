// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entity _$EntityFromJson(Map<String, dynamic> json) => Entity(
      name: json['name'] as String,
      properties: (json['properties'] as List<dynamic>)
          .map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
      isEnum: json['isEnum'] as bool? ?? false,
      generateRequest: json['generateRequest'] as bool? ?? false,
      generateResponse: json['generateResponse'] as bool? ?? false,
      exists: json['exists'] as bool? ?? false,
    )
      ..sourceName = json['sourceName'] as String
      ..entityImports = (json['entityImports'] as List<dynamic>)
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toSet();

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'name': instance.name,
      'generateRequest': instance.generateRequest,
      'generateResponse': instance.generateResponse,
      'exists': instance.exists,
      'properties': instance.properties,
      'sourceName': instance.sourceName,
      'entityImports': instance.entityImports.toList(),
      'isEnum': instance.isEnum,
    };
