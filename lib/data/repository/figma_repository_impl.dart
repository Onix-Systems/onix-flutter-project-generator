import 'package:onix_flutter_bricks/data/mapper/figma/figma_nodes_mapper.dart';
import 'package:onix_flutter_bricks/data/mapper/figma/properties_mapper.dart';
import 'package:onix_flutter_bricks/data/source/remote/figma/figma_remote_data_source.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/base_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/node_style_property/node_style_property.dart';
import 'package:onix_flutter_bricks/domain/repository/figma_repository.dart';

class FigmaRepositoryImpl implements FigmaRepository {
  final FigmaRemoteDataSource _figmaRemoteDataSource;
  final _figmaNodesMapper = FigmaNodesMapper();
  final _figmaPropertyMapper = PropertyMapper();

  FigmaRepositoryImpl({
    required FigmaRemoteDataSource figmaRemoteDataSource,
  }) : _figmaRemoteDataSource = figmaRemoteDataSource;

  @override
  Future<Map<String, NodeStyleProperty>> getFigmaFiles({
    required String figmaId,
    required String token,
  }) async {
    try {
      final result = await _figmaRemoteDataSource.getFigmaFiles(figmaId, token);
      return result.styles.map(
        (key, value) => MapEntry(
          key,
          _figmaPropertyMapper.mapNodeStyleDataModelToEntity(value),
        ),
      );
    } catch (e) {
      return {};
    }
  }

  @override
  Future<List<BaseNode>> getFigmaNodes({
    required String nodeIds,
    required String token,
    required String figmaId,
  }) async {
    try {
      final result = await _figmaRemoteDataSource.getFigmaNodes(
        nodeIds,
        token,
        figmaId,
      );
      return _figmaNodesMapper.mapNodesDataModelToEntity(result.nodes ?? []);
    } catch (e) {
      return List.empty();
    }
  }
}
