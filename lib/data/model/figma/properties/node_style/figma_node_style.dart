import 'package:freezed_annotation/freezed_annotation.dart';

part 'figma_node_style.g.dart';

// https://www.figma.com/developers/api#style-type
@JsonSerializable()
class FigmaNodeStyle {
  final String? nodeId;
  final String? name;
  final String? styleType;
  final String? description;

  const FigmaNodeStyle({
    required this.nodeId,
    required this.name,
    required this.styleType,
    required this.description,
  });

  factory FigmaNodeStyle.fromJson(Map<String, dynamic> json) =>
      _$FigmaNodeStyleFromJson(json);

  Map<String, dynamic> toJson() => _$FigmaNodeStyleToJson(this);
}
