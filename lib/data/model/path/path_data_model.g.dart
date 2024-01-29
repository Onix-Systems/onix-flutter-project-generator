// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PathDataModel _$PathDataModelFromJson(Map<String, dynamic> json) =>
    PathDataModel(
      path: json['path'] as String,
      methods: (json['methods'] as List<dynamic>)
          .map((e) => MethodDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PathDataModelToJson(PathDataModel instance) =>
    <String, dynamic>{
      'path': instance.path,
      'methods': instance.methods,
    };
