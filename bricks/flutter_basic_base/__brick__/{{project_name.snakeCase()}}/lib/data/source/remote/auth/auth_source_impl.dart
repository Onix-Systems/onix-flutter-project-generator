import 'package:{{project_name}}/app/arch/graph_ql/graph_ql_client.dart';
import 'package:{{project_name}}/app/arch/graph_ql/request_processor/graph_ql_request_processor.dart';
import 'package:{{project_name}}/data/model/authentication/dto/authentication_request.dart';
import 'package:{{project_name}}/data/model/customer_access_token/customer_token_response_data.dart';
import 'package:{{project_name}}/data/source/remote/auth/auth_source.dart';
import 'package:{{project_name}}/data/source/remote/auth/mutations/access_token_mutation.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class AuthSourceImpl extends AuthSource {
  final GraphQlClient _apiClient;
  final GraphQlRequestProcessor _graphQlProcessor;

  AuthSourceImpl(
    this._apiClient,
    this._graphQlProcessor,
  );

  @override
  Future<DataResponse<CustomerTokenResponseData>> login(
    AuthenticationRequest requestData,
  ) async {
    return _graphQlProcessor.processMutationRequest(
      client: _apiClient,
      mutation: getAccessTokenMutation,
      variables: requestData.toJson(),
      onResponse: CustomerTokenResponseData.fromJson,
      onSuccess: (data) {
        return data.customerAccessTokenCreate.customerUserErrors
                ?.map((e) => e.message)
                .toList() ??
            List.empty();
      },
    );
  }
}
