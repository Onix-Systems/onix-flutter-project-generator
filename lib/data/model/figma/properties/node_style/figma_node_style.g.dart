// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_node_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaNodeStyle _$FigmaNodeStyleFromJson(Map<String, dynamic> json) =>
    FigmaNodeStyle(
      nodeId: json['nodeId'] as String?,
      name: json['name'] as String?,
      styleType: json['styleType'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$FigmaNodeStyleToJson(FigmaNodeStyle instance) =>
    <String, dynamic>{
      'nodeId': instance.nodeId,
      'name': instance.name,
      'styleType': instance.styleType,
      'description': instance.description,
    };
