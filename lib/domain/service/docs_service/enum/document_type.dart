import 'package:onix_flutter_bricks/domain/service/docs_service/enum/document_folder_type.dart';

enum DocumentType {
  readme('README.md', DocumentFolderType.root),
  changeLog('CHANGELOG.md', DocumentFolderType.root),
  archOverview('ARCH_OVERVIEW.md', DocumentFolderType.docs),
  installInstructions('INSTALL_INSTRUCTION.md', DocumentFolderType.docs),
  techDescription('TECH_DESCRIPTION.md', DocumentFolderType.docs),
  devSolutions('DEV_SOLUTIONS.md', DocumentFolderType.devSolutions),
  devSolutionsChapter('EXAMPLE.md', DocumentFolderType.devSolutions);

  const DocumentType(
    this.fileName,
    this.folder,
  );

  final String fileName;
  final DocumentFolderType folder;

  String get fullPath => '${folder.path}$fileName';

  String get relativePath =>
      folder.path.replaceAll(DocumentFolderType.root.path, '');
}
