import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

class FirebaseFailure implements Failure {
  FirebaseFailure(this.code);

  final String code;

  @override
  String toString() {
    return 'FirebaseFailure{code: $code}';
  }
}