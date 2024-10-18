import 'dart:convert';
import 'dart:io';

class GetBranchesProcessUseCase {
  const GetBranchesProcessUseCase();

  Future<List<String>> call() async {
    final process = await Process.start(
      'git',
      [
        'ls-remote',
        'https://github.com/Onix-Systems/onix-flutter-project-generator.git',
      ],
      workingDirectory: '/',
    );
    final branches = List<String>.empty(growable: true);
    process.stdout.transform(utf8.decoder).listen(
      (event) {
        final lines = event.split('\n');
        for (final line in lines) {
          if (line.contains('refs/heads/')) {
            final start = line.indexOf('refs/heads/');
            final branch = line.substring(start).replaceAll('refs/heads/', '');
            branches.add(branch);
          }
        }
      },
    );

    await process.exitCode;
    return branches;
  }
}
