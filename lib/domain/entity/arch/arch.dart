enum Arch {
  clean,
  simple;
}

extension Path on Arch {
  String getDiPath() {
    switch (this) {
      case Arch.clean:
        return 'lib/core/di';
      case Arch.simple:
        return 'lib/app/di';
    }
  }

  String getLoggerPath() {
    switch (this) {
      case Arch.clean:
        return 'core/arch/logger/app_logger_impl.dart';
      case Arch.simple:
        return 'app/logger/app_logger_impl.dart';
    }
  }

  String getEntityPath(String namePath) {
    switch (this) {
      case Arch.clean:
        return 'app/domain/entity/$namePath';
      case Arch.simple:
        return 'data/model/$namePath';
    }
  }

  String getModelPath(String folderName, String namePath) {
    switch (this) {
      case Arch.clean:
        return 'data/model/remote/$folderName/$namePath';
      case Arch.simple:
        return 'data/model/$folderName/dto/$namePath';
    }
  }

  String getGraphQlPath(String projectRootPath) {
    switch (this) {
      case Arch.clean:
        return '$projectRootPath/lib/core/arch/data/remote/graph_ql';
      case Arch.simple:
        return '$projectRootPath/lib/app/arch';
    }
  }
}
