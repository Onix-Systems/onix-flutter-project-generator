import 'package:onix_flutter_bricks/data/mapper/figma/figma_nodes_mapper.dart';
import 'package:onix_flutter_bricks/data/mapper/figma/node_style_mapper.dart';
import 'package:onix_flutter_bricks/data/source/remote/figma/figma_remote_data_source.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/base_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/node_style_property/node_style_property.dart';
import 'package:onix_flutter_bricks/domain/repository/figma_repository.dart';

class FigmaRepositoryImpl implements FigmaRepository {
  final FigmaRemoteDataSource _figmaRemoteDataSource;

  const FigmaRepositoryImpl({
    required FigmaRemoteDataSource figmaRemoteDataSource,
  }) : _figmaRemoteDataSource = figmaRemoteDataSource;

  @override
  Future<Map<String, NodeStyleProperty>> getFigmaFiles({
    required String figmaId,
    required String token,
  }) async {
    final result = await _figmaRemoteDataSource.getFigmaFiles(figmaId, token);
    return result.styles.map(
      (key, value) => MapEntry(
        key,
        NodeStyleMapper().mapNodeStyleDataModelToEntity(value),
      ),
    );
  }

  @override
  Future<List<BaseNode>> getFigmaNodes({
    required String nodeIds,
    required String token,
    required String figmaId,
  }) async {
    final result = await _figmaRemoteDataSource.getFigmaNodes(
      nodeIds,
      token,
      figmaId,
    );
    return FigmaNodesMapper().mapNodesDataModelToEntity(result.nodes ?? []);
  }
}
