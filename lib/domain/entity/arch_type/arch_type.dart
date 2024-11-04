enum ArchType {
  clean,
  simple;
}

extension Path on ArchType {
  String getDiPath() {
    switch (this) {
      case ArchType.clean:
        return 'lib/core/di';
      case ArchType.simple:
        return 'lib/app/di';
    }
  }

  String getDiImportPrefix(String projectName) {
    switch (this) {
      case ArchType.clean:
        return "import 'package:$projectName/core/di";
      case ArchType.simple:
        return "import 'package:$projectName/app/di";
    }
  }

  String getLoggerPath() {
    switch (this) {
      case ArchType.clean:
        return 'core/arch/logger/app_logger_impl.dart';
      case ArchType.simple:
        return 'app/logger/app_logger_impl.dart';
    }
  }

  String getEntityPath(String namePath) {
    switch (this) {
      case ArchType.clean:
        return 'domain/entity/$namePath';
      case ArchType.simple:
        return 'data/model/$namePath';
    }
  }

  String getModelPath(String folderName, String namePath) {
    switch (this) {
      case ArchType.clean:
        return 'data/model/remote/$folderName/$namePath';
      case ArchType.simple:
        return 'data/model/$folderName/dto/$namePath';
    }
  }

  String getGraphQlPath() {
    switch (this) {
      case ArchType.clean:
        return 'lib/core/arch/data/remote/graph_ql';
      case ArchType.simple:
        return 'lib/app/arch';
    }
  }

  String getMapperPath() {
    switch (this) {
      case ArchType.clean:
        return 'data/mapper';
      case ArchType.simple:
        return 'data/model';
    }
  }
}
