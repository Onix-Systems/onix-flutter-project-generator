import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

var getIt = GetIt.I;

void injections() {
  getIt.registerSingleton<Logger>(Logger());
}

var logger = GetIt.I.get<Logger>();
