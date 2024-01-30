// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticky_node_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StickyNodeDataModel _$StickyNodeDataModelFromJson(Map<String, dynamic> json) =>
    StickyNodeDataModel(
      id: json['id'] as String?,
      key: json['key'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      fills: (json['fills'] as List<dynamic>?)
          ?.map(
              (e) => PaintPropertyDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StickyNodeDataModelToJson(
        StickyNodeDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'fills': instance.fills,
    };
