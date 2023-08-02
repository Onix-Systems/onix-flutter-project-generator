import 'package:get_it/get_it.dart';

import 'package:onix_flutter_bricks/domain/service/session_service/session_service.dart';

void registerServices(GetIt getIt) {
  getIt.registerSingleton<SessionService>(SessionService());
}

SessionService sessionService() => GetIt.I.get<SessionService>();
