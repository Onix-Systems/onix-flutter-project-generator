import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/data/repository/figma_repository_impl.dart';
import 'package:onix_flutter_bricks/data/repository/screen_repository_impl.dart';
import 'package:onix_flutter_bricks/data/repository/swagger_repository_impl.dart';
import 'package:onix_flutter_bricks/data/source/remote/figma/figma_remote_data_source.dart';
import 'package:onix_flutter_bricks/data/source/remote/swagger/swagger_remote_source.dart';
import 'package:onix_flutter_bricks/domain/repository/figma_repository.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

//{imports end}

void registerRepositories(GetIt getIt) {
  getIt
    ..registerSingleton<ScreenRepository>(
      ScreenRepositoryImpl(),
    )
    ..registerLazySingleton<FigmaRepository>(
      () => FigmaRepositoryImpl(
        figmaRemoteDataSource: GetIt.I.get<FigmaRemoteDataSource>(),
      ),
    )
    ..registerLazySingleton<SwaggerRepository>(
      () => SwaggerRepositoryImpl(
        GetIt.I.get<SwaggerRemoteSource>(),
      ),
    ); //{repositories end}
}

ScreenRepository get screenRepository => GetIt.I.get<ScreenRepository>();
