import 'package:{{project_name}}/core/arch/data/remote/clients/graph_ql/graph_ql_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/graph_ql/request_processor/graph_ql_request_processor.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/data_response.dart';
import 'package:{{project_name}}/data/model/remote/authentication/authentication_request.dart';
import 'package:{{project_name}}/data/model/remote/customer_access_token/customer_token_response_data.dart';
import 'package:{{project_name}}/data/source/remote/auth/auth_source.dart';
import 'package:{{project_name}}/data/source/remote/auth/mutations/access_token_mutation.dart';

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
