abstract class MakefileBase {
  final String name;
  final String dependencies;
  final List<String> commands;

  const MakefileBase({
    required this.name,
    required this.commands,
    this.dependencies = '',
  });

  List<String> toArray() {
    return [
      '$name:${dependencies.isNotEmpty ? ' $dependencies' : ''}',
      ...commands.map((e) => '\t$e'),
      '',
    ];
  }
}
