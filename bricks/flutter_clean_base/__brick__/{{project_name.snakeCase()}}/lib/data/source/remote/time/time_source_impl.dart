import 'package:{{project_name}}/core/arch/data/remote/clients/dio/api_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/dio/dio_request_processor/dio_request_processor.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/data_response.dart';
import 'package:{{project_name}}/data/model/remote/time/time/time_response.dart';
import 'package:{{project_name}}/data/source/remote/time/time_source.dart';

//{response_imports}
//{request_imports}

class TimeSourceImpl extends TimeSource {
  final ApiClient _apiClient;
  final DioRequestProcessor _dioRequestProcessor;
  final _timeNow = '/api/json/utc/now';

  TimeSourceImpl(this._apiClient, this._dioRequestProcessor);

  @override
  Future<DataResponse<TimeResponse>> getTime() async {
    final request = _apiClient.client.get(_timeNow);
    return _dioRequestProcessor.processRequest(
      onRequest: () => request,
      onResponse: (response) => TimeResponse.fromJson(response.data),
    );
  }
}
