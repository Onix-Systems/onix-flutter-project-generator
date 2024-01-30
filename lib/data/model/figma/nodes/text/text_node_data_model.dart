import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/vector/vector_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/paint/paint_property_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/type_style/figma_type_style.dart';

part 'text_node_data_model.g.dart';

// https://www.figma.com/developers/api#text-props
@JsonSerializable()
class TextNodeDataModel extends VectorNodeDataModel {
  const TextNodeDataModel({
    required super.fills,
    required super.id,
    required super.key,
    required super.name,
    required super.type,
    required this.style,
  });

  final FigmaTypeStyle? style;

  factory TextNodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$TextNodeDataModelFromJson(json);
}
