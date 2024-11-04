import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'APIKEY1')
  static final String apiKey1 = _Env.apiKey1;
  @EnviedField(varName: 'APIKEY2')
  static final String apiKey2 = _Env.apiKey2;
}
