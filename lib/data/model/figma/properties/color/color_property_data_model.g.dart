// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_property_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorPropertyDataModel _$ColorPropertyDataModelFromJson(
        Map<String, dynamic> json) =>
    ColorPropertyDataModel(
      r: (json['r'] as num?)?.toDouble(),
      g: (json['g'] as num?)?.toDouble(),
      b: (json['b'] as num?)?.toDouble(),
      a: (json['a'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ColorPropertyDataModelToJson(
        ColorPropertyDataModel instance) =>
    <String, dynamic>{
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
      'a': instance.a,
    };
