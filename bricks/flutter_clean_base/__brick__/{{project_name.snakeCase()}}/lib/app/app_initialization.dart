import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/core/arch/logger/app_logger_impl.dart';
import 'package:{{project_name}}/core/di/app.dart';
import 'package:{{project_name}}/core/di/injection.dart';

class Initialization {
  static final Initialization _instance = Initialization._privateConstructor();

  static Initialization get I => _instance;

  Initialization._privateConstructor();

  Future<void> initApp() async {
    //TODO init firebase / Crashlytics / Messaging

    initializeDi(GetIt.I);
    await _initializeDatabase();
    logger.d('APP Init: done');
  }

  Future<void> _initializeDatabase() async {
    //TODO init databases here
  }
}
