enum ArchType {
  clean,
  basic;
}

extension Path on ArchType {
  String getDiPath() {
    switch (this) {
      case ArchType.clean:
        return 'lib/core/di';
      case ArchType.basic:
        return 'lib/app/di';
    }
  }

  String getDiImportPrefix(String projectName) {
    switch (this) {
      case ArchType.clean:
        return "import 'package:$projectName/core/di";
      case ArchType.basic:
        return "import 'package:$projectName/app/di";
    }
  }

  String getLoggerPath() {
    switch (this) {
      case ArchType.clean:
        return 'core/arch/logger/app_logger_impl.dart';
      case ArchType.basic:
        return 'app/logger/app_logger_impl.dart';
    }
  }

  String getEntityPath(String folderName,String namePath) {
    switch (this) {
      case ArchType.clean:
        return 'domain/entity/$folderName/$namePath';
      case ArchType.basic:
        return 'data/model/domain/$folderName/$namePath';
    }
  }

  String getModelPath(String folderName, String namePath) {
    switch (this) {
      case ArchType.clean:
        return 'data/model/remote/$folderName/$namePath';
      case ArchType.basic:
        return 'data/model/$folderName/dto/$namePath';
    }
  }

  String getGraphQlPath() {
    switch (this) {
      case ArchType.clean:
        return 'lib/core/arch/data/remote/graph_ql';
      case ArchType.basic:
        return 'lib/app/arch';
    }
  }

  String getMapperPath() {
    switch (this) {
      case ArchType.clean:
        return 'data/mapper';
      case ArchType.basic:
        return 'data/mapper';
    }
  }
}
