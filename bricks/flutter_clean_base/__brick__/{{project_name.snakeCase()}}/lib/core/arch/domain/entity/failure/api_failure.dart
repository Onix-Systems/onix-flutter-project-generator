import 'package:{{project_name}}/core/arch/domain/entity/failure/failure.dart';

class ApiFailure implements FeatureFailure {
  final ServerFailure failure;
  final int? statusCode;

  final String message;

  ApiFailure(
    this.failure, {
    this.message = '',
    this.statusCode,
  });

  @override
  String toString() {
    return 'ApiFailure{$failure, message: $message, statusCode: $statusCode}';
  }
}

enum ServerFailure {
  noNetwork,
  exception,
  unAuthorized,
  tooManyRequests,
  response,
  unknown,
}
