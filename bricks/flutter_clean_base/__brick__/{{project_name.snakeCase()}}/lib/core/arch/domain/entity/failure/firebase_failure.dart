import 'package:{{project_name}}/core/arch/domain/entity/failure/failure.dart';

class FirebaseFailure implements FeatureFailure {
  FirebaseFailure(this.code);

  final String code;

  @override
  String toString() {
    return 'FirebaseFailure{code: $code}';
  }
}
