import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/core/di/app.dart';
import 'package:{{project_name}}/core/di/injection.dart';

class AppInitialization {
  static final AppInitialization _instance =
      AppInitialization._privateConstructor();

  static AppInitialization get I => _instance;

  AppInitialization._privateConstructor();

  Future<void> initApp() async {
    //TODO init firebase / Crashlytics / Messaging
    await _initializeDatabase();
    initializeDi(GetIt.I);
    logger.d('APP Init: done');
  }

  Future<void> _initializeDatabase() async {
    //TODO init databases here
  }
}
