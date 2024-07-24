abstract class MakefileBase {
  final String name;
  final String args;
  final List<String> commands;

  const MakefileBase({
    required this.name,
    required this.commands,
    this.args = '',
  });

  List<String> toArray() {
    return [
      '$name:${args.isNotEmpty ? ' $args' : ''}',
      ...commands.map((e) => '\t$e'),
      ''
    ];
  }
}
