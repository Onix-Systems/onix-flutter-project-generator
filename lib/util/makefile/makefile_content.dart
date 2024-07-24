import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:onix_flutter_bricks/util/makefile/makefile_base.dart';

class MakefileContent {
  final List<MakefileBase> commands;

  const MakefileContent({required this.commands});

  List<String> convertCommandsToListString() {
    final array = <String>[];

    for (final line in commands) {
      array
        ..addAll(line.toArray())
        ..addNewLine();
    }
    return array;
  }
}
