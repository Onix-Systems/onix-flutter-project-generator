// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_paints_node_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FillPaintsNodeDataModel _$FillPaintsNodeDataModelFromJson(
        Map<String, dynamic> json) =>
    FillPaintsNodeDataModel(
      id: json['id'] as String?,
      key: json['key'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      fills: (json['fills'] as List<dynamic>?)
          ?.map(
              (e) => PaintPropertyDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FillPaintsNodeDataModelToJson(
        FillPaintsNodeDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'fills': instance.fills,
    };
