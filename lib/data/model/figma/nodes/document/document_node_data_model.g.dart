// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_node_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentNodeDataModel _$DocumentNodeDataModelFromJson(
        Map<String, dynamic> json) =>
    DocumentNodeDataModel(
      children: (json['children'] as List<dynamic>?)
          ?.map((e) =>
              _$JsonConverterFromJson<Map<String, dynamic>, NodeDataModel>(
                  e, const FigmaNodeTypeConverter().fromJson))
          .toList(),
      id: json['id'] as String?,
      key: json['key'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$DocumentNodeDataModelToJson(
        DocumentNodeDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'children': instance.children
          ?.map((e) =>
              _$JsonConverterToJson<Map<String, dynamic>, NodeDataModel>(
                  e, const FigmaNodeTypeConverter().toJson))
          .toList(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
