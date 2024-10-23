enum Arch {
  clean,
  simple;
}

extension Path on Arch {
  String getDiPath(String projectRootPath) {
    switch (this) {
      case Arch.simple:
        return '$projectRootPath/lib/app/di';
      case Arch.clean:
        return '$projectRootPath/lib/core/di';
    }
  }
}
