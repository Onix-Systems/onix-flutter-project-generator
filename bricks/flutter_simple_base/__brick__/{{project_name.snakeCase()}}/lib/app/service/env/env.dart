import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
abstract class Env {
  @EnviedField(varName: 'APIKEY1')
  static const String apiKey1 = _Env.apiKey1;
  @EnviedField(varName: 'APIKEY2')
  static const String apiKey2 = _Env.apiKey2;
}
