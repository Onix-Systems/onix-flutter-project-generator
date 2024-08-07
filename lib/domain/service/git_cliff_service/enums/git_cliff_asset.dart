enum GitCliffAsset {
  cliffMD(
    assetPath: 'assets/git_cliff',
    fileName: 'cliff_md.toml',
  ),
  cliffTXT(
    assetPath: 'assets/git_cliff',
    fileName: 'cliff_txt.toml',
  );

  final String assetPath;
  final String fileName;

  const GitCliffAsset({
    required this.assetPath,
    required this.fileName,
  });

  String getOutputPath({
    required String projectPath,
  }) =>
      '$projectPath/$fileName';

  String get fullAssetPath => '$assetPath/$fileName';
}
