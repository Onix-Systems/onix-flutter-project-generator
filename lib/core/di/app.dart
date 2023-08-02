//@formatter:off

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void registerApp(GetIt getIt) {
  getIt.registerSingleton<Logger>(Logger());
}

Logger get logger => GetIt.I<Logger>();
