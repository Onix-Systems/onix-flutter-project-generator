import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
abstract class Env {
  @EnviedField(obfuscate: true, varName: 'APIKEY1')
  static const apiKey1;
  @EnviedField(obfuscate: true, varName: 'APIKEY2')
  static const apiKey2;
}
