import 'package:graphql/client.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:{{project_name}}/core/arch/data/remote/graph_ql/graph_ql_const.dart';

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

  @override
  void attachCacheInterceptor(CacheInterceptor cacheInterceptor) {}
}
