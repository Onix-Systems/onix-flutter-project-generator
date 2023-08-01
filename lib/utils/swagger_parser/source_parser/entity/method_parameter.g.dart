// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MethodParameter _$MethodParameterFromJson(Map<String, dynamic> json) =>
    MethodParameter(
      place: json['place'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      nullable: json['nullable'] as bool? ?? false,
    );

Map<String, dynamic> _$MethodParameterToJson(MethodParameter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'nullable': instance.nullable,
      'place': instance.place,
    };
