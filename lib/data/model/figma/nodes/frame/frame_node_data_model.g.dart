// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frame_node_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FrameNodeDataModel _$FrameNodeDataModelFromJson(Map<String, dynamic> json) =>
    FrameNodeDataModel(
      id: json['id'] as String?,
      key: json['key'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      fills: (json['fills'] as List<dynamic>?)
          ?.map(
              (e) => PaintPropertyDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FrameNodeDataModelToJson(FrameNodeDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'fills': instance.fills,
    };
