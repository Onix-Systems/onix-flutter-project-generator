// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenDataModel _$ScreenDataModelFromJson(Map<String, dynamic> json) =>
    ScreenDataModel(
      name: json['name'] as String?,
      stateManager: json['stateManager'] as String?,
      exists: json['exists'] as bool?,
    );

Map<String, dynamic> _$ScreenDataModelToJson(ScreenDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'stateManager': instance.stateManager,
      'exists': instance.exists,
    };
