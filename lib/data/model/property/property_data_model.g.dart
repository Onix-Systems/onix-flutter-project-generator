// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyDataModel _$PropertyDataModelFromJson(Map<String, dynamic> json) =>
    PropertyDataModel(
      name: json['name'] as String?,
      type: json['type'] as String?,
      nullable: json['nullable'] as bool?,
      isList: json['isList'] as bool?,
    );

Map<String, dynamic> _$PropertyDataModelToJson(PropertyDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'nullable': instance.nullable,
      'isList': instance.isList,
    };
