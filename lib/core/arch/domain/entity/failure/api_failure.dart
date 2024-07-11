 import 'package:onix_flutter_bricks/core/arch/domain/entity/failure/failure.dart';

class ApiFailure implements Failure {
  final int code;

  ApiFailure({required this.code});
}

///When Failed to parse swagger components
 class SwaggerParserFailure implements Failure {

   SwaggerParserFailure();
 }
