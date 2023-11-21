// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_color_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppColorStyle _$AppColorStyleFromJson(Map<String, dynamic> json) =>
    AppColorStyle(
      alpha: json['alpha'] as int,
      r: json['r'] as int,
      g: json['g'] as int,
      b: json['b'] as int,
      opacity: (json['opacity'] as num).toDouble(),
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AppColorStyleToJson(AppColorStyle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alpha': instance.alpha,
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
      'opacity': instance.opacity,
    };
