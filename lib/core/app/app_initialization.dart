import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/core/di/injection.dart';

class AppInitialization {
  static final AppInitialization _instance =
      AppInitialization._privateConstructor();

  static AppInitialization get I => _instance;

  AppInitialization._privateConstructor();

  Future<void> initApp() async {
    initializeDi(GetIt.I);
    logger.d('APP Init: done');
  }
}
