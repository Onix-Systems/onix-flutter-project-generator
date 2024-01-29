import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/document/document_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/styles/figma_node_style.dart';

part 'figma_file_response.g.dart';

@JsonSerializable()
class FigmaFileResponse {
  final String? name;
  final Map<String, FigmaNodeStyle> styles;
  final DocumentNodeDataModel? document;

  const FigmaFileResponse({
    required this.name,
    required this.styles,
    required this.document,
  });

  factory FigmaFileResponse.fromJson(Map<String, dynamic> json) =>
      _$FigmaFileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FigmaFileResponseToJson(this);
}
