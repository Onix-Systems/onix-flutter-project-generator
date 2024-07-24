abstract final class ProjectNameValidator {
  static bool isValidName(String value) {
    return !value.startsWith(RegExp('[0-9]')) &&
        !value.startsWith('_') &&
        !value.endsWith('_') &&
        !_packageDependencies.contains(value);
  }

  static const Set<String> _packageDependencies = <String>{
    'analyzer',
    'args',
    'async',
    'collection',
    'convert',
    'crypto',
    'flutter',
    'flutter_test',
    'front_end',
    'html',
    'http',
    'intl',
    'io',
    'isolate',
    'kernel',
    'logging',
    'matcher',
    'meta',
    'mime',
    'path',
    'plugin',
    'pool',
    'test',
    'utf',
    'watcher',
    'yaml'
  };
}
