import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/data/model/figma/responses/file_response/figma_file_response.dart';
import 'package:onix_flutter_bricks/data/model/figma/responses/node/figma_nodes_response.dart';
import 'package:onix_flutter_bricks/data/source/remote/figma/figma_remote_data_source.dart';

class FigmaRemoteDataSourceImpl implements FigmaRemoteDataSource {
  const FigmaRemoteDataSourceImpl();

  @override
  Future<FigmaFileResponse> getFigmaFiles(
    String figmaId,
    String token,
  ) async {
    final response = await http.get(
      Uri.parse('${AppConsts.figmaBaseUrl}/files/$figmaId/'),
      headers: {'X-Figma-Token': token},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to get styles From Figma API');
    }

    return FigmaFileResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  @override
  Future<FigmaNodesResponse> getFigmaNodes(
    String nodeIds,
    String token,
    String figmaId,
  ) async {
    final response = await http.get(
      Uri.parse('${AppConsts.figmaBaseUrl}/files/$figmaId/nodes?ids=$nodeIds'),
      headers: {'X-Figma-Token': token},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to get nodes From Figma API');
    }

    return FigmaNodesResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
