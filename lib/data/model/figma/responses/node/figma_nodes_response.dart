import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/converter/figma/figma_nodes_converter.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/node/node_data_model.dart';

part 'figma_nodes_response.g.dart';

@JsonSerializable()
class FigmaNodesResponse {
  @FigmaNodesConverter()
  final List<NodeDataModel>? nodes;

  const FigmaNodesResponse({required this.nodes});

  factory FigmaNodesResponse.fromJson(Map<String, dynamic> json) =>
      _$FigmaNodesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FigmaNodesResponseToJson(this);
}
