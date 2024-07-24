abstract class MakefileBase {
  final String name;
  final List<String> commands;

  const MakefileBase({required this.name, required this.commands});

  List<String> toArray() {
    return ['$name:', ...commands.map((e) => '\t$e'), ''];
  }
}
