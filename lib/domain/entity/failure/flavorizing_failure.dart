import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

enum FlavorizingFailureType { exception, cannotGetOrg, alreadyFlavorized }

class FlavorizingFailure implements Failure {
  FlavorizingFailure(
    this.type, {
    this.e,
  });

  FlavorizingFailureType type;
  Exception? e;
}
