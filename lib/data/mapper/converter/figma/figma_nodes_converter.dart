import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/data/mapper/converter/figma/figma_node_type_converter.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/node/node_data_model.dart';

class FigmaNodesConverter
    extends JsonConverter<List<NodeDataModel>, Map<String, dynamic>> {
  const FigmaNodesConverter();

  @override
  List<NodeDataModel> fromJson(Map<String, dynamic> json) {
    final list = json.values
        .map(
          (e) => const FigmaNodeTypeConverter().fromJson(
            (e as Map<String, dynamic>)['document'],
          ),
        )
        .toList();

    return list;
  }

  @override
  Map<String, dynamic> toJson(List<NodeDataModel> object) {
    throw UnimplementedError();
  }
}
