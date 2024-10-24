enum Arch {
  clean,
  simple;
}

extension Path on Arch {
  String getDiPath() {
    switch (this) {
      case Arch.simple:
        return 'lib/app/di';
      case Arch.clean:
        return 'lib/core/di';
    }
  }

  String getLoggerPath() {
    switch (this) {
      case Arch.simple:
        return 'app/logger/app_logger_impl.dart';
      case Arch.clean:
        return 'core/arch/logger/app_logger_impl.dart';
    }
  }
}
