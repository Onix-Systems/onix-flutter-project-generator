import 'package:{{project_name}}/core/arch/data/remote/base/base_api_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/graph_ql/graph_ql_const.dart';
import 'package:graphql/client.dart';

class GraphQlClient implements BaseApiClient<GraphQLClient> {
  @override
  late GraphQLClient client;

  GraphQlClient() {
    client = _createClient(baseUrl: GraphQlConst.graphQLBaseUrl);
  }

  GraphQLClient _createClient({
    required String baseUrl,
  }) {
    return GraphQLClient(
      link: HttpLink(
        baseUrl,
        defaultHeaders: {
          //TODO: specify headers
        },
      ),
      cache: GraphQLCache(),
    );
  }

  @override
  void attachInterceptors() {}

  @override
  void attachLoggerInterceptor() {}

  @override
  void deAttachInterceptors() {}
}
