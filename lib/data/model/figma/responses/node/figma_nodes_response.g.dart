// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_nodes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaNodesResponse _$FigmaNodesResponseFromJson(Map<String, dynamic> json) =>
    FigmaNodesResponse(
      nodes: _$JsonConverterFromJson<Map<String, dynamic>, List<NodeDataModel>>(
          json['nodes'], const FigmaNodesConverter().fromJson),
    );

Map<String, dynamic> _$FigmaNodesResponseToJson(FigmaNodesResponse instance) =>
    <String, dynamic>{
      'nodes': _$JsonConverterToJson<Map<String, dynamic>, List<NodeDataModel>>(
          instance.nodes, const FigmaNodesConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
