// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_node_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextNodeDataModel _$TextNodeDataModelFromJson(Map<String, dynamic> json) =>
    TextNodeDataModel(
      fills: (json['fills'] as List<dynamic>?)
          ?.map(
              (e) => PaintPropertyDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      key: json['key'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      style: json['style'] == null
          ? null
          : FigmaTypeStyle.fromJson(json['style'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextNodeDataModelToJson(TextNodeDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'fills': instance.fills,
      'style': instance.style,
    };
