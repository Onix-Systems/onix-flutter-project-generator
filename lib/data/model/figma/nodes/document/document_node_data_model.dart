import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/mapper/converter/figma/figma_node_type_converter.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/node/node_data_model.dart';
part 'document_node_data_model.g.dart';

@JsonSerializable()
class DocumentNodeDataModel extends NodeDataModel {
  @FigmaNodeTypeConverter()
  final List<NodeDataModel?>? children;

  const DocumentNodeDataModel({
    required this.children,
    required super.id,
    required super.key,
    required super.name,
    required super.type,
  });

  factory DocumentNodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentNodeDataModelFromJson(json);
}

