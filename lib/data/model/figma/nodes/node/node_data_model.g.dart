// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeDataModel _$NodeDataModelFromJson(Map<String, dynamic> json) =>
    NodeDataModel(
      id: json['id'] as String?,
      key: json['key'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$NodeDataModelToJson(NodeDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
    };
