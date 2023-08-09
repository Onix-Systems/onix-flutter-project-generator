import 'package:get_it/get_it.dart';

import 'package:onix_flutter_bricks/core/arch/data/remote/api_client.dart';
import 'package:onix_flutter_bricks/core/arch/data/remote/dio_const.dart';
import 'package:onix_flutter_bricks/core/arch/data/remote/dio_request_processor/dio_request_processor.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source/config_source.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source/config_source_impl.dart';
import 'package:onix_flutter_bricks/data/source/remote/time/time_source.dart';
import 'package:onix_flutter_bricks/data/source/remote/time/time_source_impl.dart';

//{imports end}

void registerSources(GetIt getIt) {
  getIt
    ..registerSingleton<TimeSource>(TimeSourceImpl(
      getIt.get<ApiClient>(instanceName: DioConst.timeApiInstance),
      getIt.get<DioRequestProcessor>(),
    ))
    ..registerSingleton<ConfigSource>(ConfigSourceImpl()); //{sources end}
}

TimeSource get timeSource => GetIt.I.get<TimeSource>();

ConfigSource get configSource => GetIt.I.get<ConfigSource>();
