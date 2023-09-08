import 'package:get_it/get_it.dart';

import 'package:onix_flutter_bricks/data/source/local/config_source/config_source.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source/config_source_impl.dart';

//{imports end}

void registerSources(GetIt getIt) {
  getIt.registerSingleton<ConfigSource>(ConfigSourceImpl()); //{sources end}
}

ConfigSource get configSource => GetIt.I.get<ConfigSource>();
