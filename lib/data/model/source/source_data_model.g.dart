// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceDataModel _$SourceDataModelFromJson(Map<String, dynamic> json) =>
    SourceDataModel(
      name: json['name'] as String?,
      isExist: json['isExist'] as bool?,
      isGenerated: json['isGenerated'] as bool?,
      paths: (json['paths'] as List<dynamic>?)
          ?.map((e) => PathDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataComponentsNames: (json['dataComponentsNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SourceDataModelToJson(SourceDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isExist': instance.isExist,
      'isGenerated': instance.isGenerated,
      'paths': instance.paths,
      'dataComponentsNames': instance.dataComponentsNames,
    };
