import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

class JsonParserFailure extends Failure {
  final Exception e;

  JsonParserFailure({required this.e}) : super();
}
