import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_data_model.g.dart';

@JsonSerializable()
class NodeDataModel {
  final String? id;
  final String? key;
  final String? name;
  final String? type;

  const NodeDataModel({
    required this.id,
    required this.key,
    required this.name,
    required this.type,
  });

  factory NodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$NodeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$NodeDataModelToJson(this);
}
