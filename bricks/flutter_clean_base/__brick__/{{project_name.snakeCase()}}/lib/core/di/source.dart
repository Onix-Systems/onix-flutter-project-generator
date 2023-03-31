import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/core/arch/data/remote/api_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/dio_const.dart';
import 'package:{{project_name}}/core/arch/data/remote/dio_request_processor/dio_request_processor.dart';
import 'package:{{project_name}}/data/source/remote/time/time_source.dart';
import 'package:{{project_name}}/data/source/remote/time/time_source_impl.dart';
//{imports end}

void registerSources(GetIt getIt) {
  getIt
    ..registerSingleton<TimeSource>(TimeSourceImpl(
      getIt.get<ApiClient>(instanceName: DioConst.timeApiInstance),
      getIt.get<DioRequestProcessor>(),
    )); //{sources end}
}

TimeSource get timeSource => GetIt.I.get<TimeSource>();
