import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source/config_source.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source/config_source_impl.dart';
import 'package:onix_flutter_bricks/data/source/remote/figma/figma_remote_data_source.dart';
import 'package:onix_flutter_bricks/data/source/remote/figma/figma_remote_source_impl.dart';
import 'package:onix_flutter_bricks/data/source/remote/swagger/swagger_remote_source.dart';
import 'package:onix_flutter_bricks/data/source/remote/swagger/swagger_remote_source_impl.dart';

//{imports end}

void registerSources(GetIt getIt) {
  getIt
    ..registerSingleton<ConfigSource>(ConfigSourceImpl())
    ..registerLazySingleton<FigmaRemoteDataSource>(
      () => const FigmaRemoteDataSourceImpl(),
    )
    ..registerLazySingleton<SwaggerRemoteSource>(
      () => SwaggerRemoteSourceImpl(),
    );
  //{sources end}
}

ConfigSource get configSource => GetIt.I.get<ConfigSource>();
