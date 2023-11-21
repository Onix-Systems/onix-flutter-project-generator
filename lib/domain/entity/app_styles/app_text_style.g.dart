// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_text_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppTextStyle _$AppTextStyleFromJson(Map<String, dynamic> json) => AppTextStyle(
      fontFamily: json['fontFamily'] as String,
      fontSize: (json['fontSize'] as num).toDouble(),
      fontWeight: json['fontWeight'] as int,
      letterSpacing: (json['letterSpacing'] as num).toDouble(),
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AppTextStyleToJson(AppTextStyle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fontFamily': instance.fontFamily,
      'fontSize': instance.fontSize,
      'fontWeight': instance.fontWeight,
      'letterSpacing': instance.letterSpacing,
    };
