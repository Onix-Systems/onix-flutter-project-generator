import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/data/repository/data_component_repository_impl.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/data/repository/screen_repository_impl.dart';
import 'package:onix_flutter_bricks/domain/repository/source_repository.dart';
import 'package:onix_flutter_bricks/data/repository/source_repository_impl.dart';

//{imports end}

void registerRepositories(GetIt getIt) {
  getIt
    ..registerSingleton<ScreenRepository>(
      ScreenRepositoryImpl(),
    )
    ..registerSingleton<DataComponentRepository>(
      DataComponentRepositoryImpl(),
    )
    ..registerSingleton<SourceRepository>(
      SourceRepositoryImpl(),
    ); //{repositories end}
}

ScreenRepository get screenRepository => GetIt.I.get<ScreenRepository>();

DataComponentRepository get dataComponentRepository =>
    GetIt.I.get<DataComponentRepository>();

SourceRepository get sourceRepository => GetIt.I.get<SourceRepository>();
