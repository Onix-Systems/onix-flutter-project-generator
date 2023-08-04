import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/data/repository/time_repository_impl.dart';
import 'package:onix_flutter_bricks/data/repository/token_repository_impl.dart';
import 'package:onix_flutter_bricks/data/source/local/secure_storage/secure_storage_source.dart';
import 'package:onix_flutter_bricks/data/source/remote/time/time_source.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository/data_component_repository_impl.dart';
import 'package:onix_flutter_bricks/domain/repository/source_repository/source_repository.dart';
import 'package:onix_flutter_bricks/domain/repository/source_repository/source_repository_impl.dart';
import 'package:onix_flutter_bricks/domain/repository/time_repository.dart';
import 'package:onix_flutter_bricks/domain/repository/token_repository.dart';

//{imports end}

void registerRepositories(GetIt getIt) {
  getIt
    ..registerSingleton<TimeRepository>(
      TimeRepositoryImpl(getIt<TimeSource>()),
    )
    ..registerSingleton<TokenRepository>(
      TokenRepositoryImpl(getIt<SecureStorageSource>()),
    )
    ..registerSingleton<DataComponentRepository>(
      DataComponentRepositoryImpl(),
    )
    ..registerSingleton<SourceRepository>(
      SourceRepositoryImpl(),
    ); //{repositories end}
}

TokenRepository get tokenRepository => GetIt.I.get<TokenRepository>();

DataComponentRepository get dataComponentRepository =>
    GetIt.I.get<DataComponentRepository>();

SourceRepository get sourceRepository => GetIt.I.get<SourceRepository>();
