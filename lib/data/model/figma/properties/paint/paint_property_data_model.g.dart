// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paint_property_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaintPropertyDataModel _$PaintPropertyDataModelFromJson(
        Map<String, dynamic> json) =>
    PaintPropertyDataModel(
      color: json['color'] == null
          ? null
          : ColorPropertyDataModel.fromJson(
              json['color'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$PaintPropertyDataModelToJson(
        PaintPropertyDataModel instance) =>
    <String, dynamic>{
      'color': instance.color,
      'type': instance.type,
    };
