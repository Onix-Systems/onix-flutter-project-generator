// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_component_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataComponentModel _$DataComponentModelFromJson(Map<String, dynamic> json) =>
    DataComponentModel(
      name: json['name'] as String?,
      generateRequest: json['generateRequest'] as bool?,
      generateResponse: json['generateResponse'] as bool?,
      isExist: json['isExist'] as bool?,
      isGenerated: json['isGenerated'] as bool?,
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => PropertyDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      imports:
          (json['imports'] as List<dynamic>?)?.map((e) => e as String).toSet(),
      sourceName: json['sourceName'] as String?,
      isEnum: json['isEnum'] as bool?,
    );

Map<String, dynamic> _$DataComponentModelToJson(DataComponentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'generateRequest': instance.generateRequest,
      'generateResponse': instance.generateResponse,
      'isExist': instance.isExist,
      'isGenerated': instance.isGenerated,
      'properties': instance.properties,
      'imports': instance.imports?.toList(),
      'sourceName': instance.sourceName,
      'isEnum': instance.isEnum,
    };
