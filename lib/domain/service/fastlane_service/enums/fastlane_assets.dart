const _filePath = 'assets/fastlane/';

enum FastlaneAssets {
  appFile(assetPath: _filePath, name: 'Appfile'),
  fastFile(assetPath: _filePath, name: 'Fastfile'),
  pluginFile(assetPath: _filePath, name: 'Pluginfile'),
  gemFile(assetPath: _filePath, name: 'Gemfile');

  final String name;
  final String assetPath;

  const FastlaneAssets({
    required this.name,
    required this.assetPath,
  });

  String getAssetPath({required String platform}) {
    return '$assetPath$platform/$name';
  }

  String getOutputPath({
    required String projectPath,
    required String platform,
  }) {
    switch (this) {
      case FastlaneAssets.appFile:
      case FastlaneAssets.fastFile:
      case FastlaneAssets.pluginFile:
        return '$projectPath/$platform/fastlane/$name';
      case FastlaneAssets.gemFile:
        return '$projectPath/$platform/$name';
    }
  }
}
