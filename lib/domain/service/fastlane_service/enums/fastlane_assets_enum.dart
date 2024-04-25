const _defaultPath = 'assets/fastlane/';

enum FastlaneAssets {
  appFile(assetPath: _defaultPath, name: 'Appfile'),
  fastFile(assetPath: _defaultPath, name: 'Fastfile'),
  pluginFile(assetPath: _defaultPath, name: 'Pluginfile'),
  readme(assetPath: _defaultPath, name: 'README.md'),
  gemFile(
    assetPath: _defaultPath,
    name: 'Gemfile',
    isPlatformDirectoryFile: false,
  );

  final String name;
  final String assetPath;
  final bool isPlatformDirectoryFile;

  const FastlaneAssets({
    required this.name,
    required this.assetPath,
    this.isPlatformDirectoryFile = true,
  });
}

enum FastlaneAssetPath {
  androidPath,
  iosPath,

}