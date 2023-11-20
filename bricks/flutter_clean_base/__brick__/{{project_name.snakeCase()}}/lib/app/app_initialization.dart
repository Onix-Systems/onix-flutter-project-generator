//@formatter:off
import 'package:get_it/get_it.dart';
{{#firebase_auth}}import 'package:{{project_name}}/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';{{/firebase_auth}}
import 'package:{{project_name}}/core/di/app.dart';
import 'package:{{project_name}}/core/di/injection.dart';

class Initialization {
  static final Initialization _instance = Initialization._privateConstructor();

  static Initialization get I => _instance;

  Initialization._privateConstructor();

  Future<void> initApp() async {
    //TODO init firebase / Crashlytics / Messaging
    {{#firebase_auth}}await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );{{/firebase_auth}}
    initializeDi(GetIt.I);
    await _initializeDatabase();
    logger.d('APP Init: done');
  }

  Future<void> _initializeDatabase() async {
    //TODO init databases here
  }
}
