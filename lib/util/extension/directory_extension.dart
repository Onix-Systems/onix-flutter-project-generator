import 'dart:io';

extension DirectoryExtension on Directory {
  bool isFlutterProjectDirectory() {
    final directoryFiles = listSync();
    final pubspecFies = directoryFiles
        .map(
          (e) => e.path,
        )
        .where(
          (e) => e.endsWith('pubspec.yaml'),
        );
    return pubspecFies.isNotEmpty;
  }
}
