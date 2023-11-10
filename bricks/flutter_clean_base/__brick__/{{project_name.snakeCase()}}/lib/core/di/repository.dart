import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/core/di/source.dart';
import 'package:{{project_name}}/data/repository/time_repository_impl.dart';
import 'package:{{project_name}}/data/repository/token_repository_impl.dart';
import 'package:{{project_name}}/data/source/remote/time/time_source.dart';
import 'package:{{project_name}}/domain/repository/time_repository.dart';
import 'package:{{project_name}}/domain/repository/token_repository.dart';
import 'package:{{project_name}}/data/source/local/secure_storage/secure_storage_source.dart';
import 'package:{{project_name}}/data/repository/firebase_auth_repository_impl.dart';
import 'package:{{project_name}}/data/source/remote/firebase/auth/firebase_auth_source.dart';
import 'package:{{project_name}}/domain/repository/firebase_auth_repository.dart';
//{imports end}

void registerRepositories(GetIt getIt) {
  getIt
    ..registerSingleton<TimeRepository>(
      TimeRepositoryImpl(getIt<TimeSource>()),
    )
    ..registerSingleton<TokenRepository>(
      TokenRepositoryImpl(getIt<SecureStorageSource>()),
    )
    ..registerSingleton<FirebaseAuthRepository>(
      FirebaseAuthRepositoryImpl(
        getIt<FirebaseAuthSource>(),
      ),
    ); //{repositories end}
}

TokenRepository get tokenRepository => GetIt.I.get<TokenRepository>();
