// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      name: json['name'] as String,
      type: json['type'] as String,
      nullable: json['nullable'] as bool? ?? false,
      isList: json['isList'] as bool? ?? false,
    );

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'nullable': instance.nullable,
      'isList': instance.isList,
    };
