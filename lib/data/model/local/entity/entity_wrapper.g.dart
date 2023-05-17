// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityWrapper _$EntityWrapperFromJson(Map<String, dynamic> json) =>
    EntityWrapper(
      name: json['name'] as String,
      generateRequest: json['generateRequest'] as bool? ?? false,
      generateResponse: json['generateResponse'] as bool? ?? false,
      exists: json['exists'] as bool? ?? false,
      classBody: json['classBody'] as String? ?? '',
      properties: (json['properties'] as List<dynamic>?)
              ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isEnum: json['isEnum'] as bool? ?? false,
    );

Map<String, dynamic> _$EntityWrapperToJson(EntityWrapper instance) =>
    <String, dynamic>{
      'name': instance.name,
      'generateRequest': instance.generateRequest,
      'generateResponse': instance.generateResponse,
      'exists': instance.exists,
      'classBody': instance.classBody,
      'properties': instance.properties,
      'isEnum': instance.isEnum,
    };
