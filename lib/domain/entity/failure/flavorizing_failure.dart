enum FlavorizingFailureType { exception, cannotGetOrg, alreadyFlavorized }

class FlavorizingFailure implements Exception {
  FlavorizingFailure(
    this.type, {
    this.e,
  });

  FlavorizingFailureType type;
  Exception? e;
}
