enum Arch {
  clean,
  base;
}

extension Path on Arch {
  String getDiPath(String projectRootPath) {
    switch (name) {
      case 'base':
        return '$projectRootPath/lib/app/di';
      case 'clean':
      default:
        return '$projectRootPath/lib/core/di';
    }
  }
}
