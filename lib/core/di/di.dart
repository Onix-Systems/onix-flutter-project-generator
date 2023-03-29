import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

var getIt = GetIt.I;

void injections() {
  getIt.registerSingleton<Logger>(Logger());
  getIt.registerSingleton<OutputService>(OutputService());
}

Logger get logger => GetIt.I.get<Logger>();

OutputService get outputService => GetIt.I.get<OutputService>();
