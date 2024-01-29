// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MethodDataModel _$MethodDataModelFromJson(Map<String, dynamic> json) =>
    MethodDataModel(
      methodType: json['methodType'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      entities:
          (json['entities'] as List<dynamic>?)?.map((e) => e as String).toSet(),
    );

Map<String, dynamic> _$MethodDataModelToJson(MethodDataModel instance) =>
    <String, dynamic>{
      'methodType': instance.methodType,
      'tags': instance.tags,
      'entities': instance.entities?.toList(),
    };
