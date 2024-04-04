enum DocumentFolderType {
  root('assets/documentation/'),
  docs('assets/documentation/docs/'),
  devSolutions('assets/documentation/docs/dev_solutions/');

  const DocumentFolderType(
      this.path,
      );

  final String path;
}