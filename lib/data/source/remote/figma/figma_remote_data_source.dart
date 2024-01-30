import 'package:onix_flutter_bricks/data/model/figma/responses/file_response/figma_file_response.dart';
import 'package:onix_flutter_bricks/data/model/figma/responses/node/figma_nodes_response.dart';

abstract interface class FigmaRemoteDataSource {
  Future<FigmaFileResponse> getFigmaFiles(
    String figmaId,
    String token,
  );

  Future<FigmaNodesResponse> getFigmaNodes(
    String nodeIds,
    String token,
    String figmaId,
  );
}
