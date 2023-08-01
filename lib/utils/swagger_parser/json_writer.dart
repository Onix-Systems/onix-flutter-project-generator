class JsonWriter {
  static void write({required Map<String, dynamic> json, int iteration = 0}) {
    final prefix = '${'  ' * iteration}${iteration == 0 ? '' : ' ↪ '}';
    for (final key in json.keys) {
      final value = json[key];
      print('${prefix}key: $key');
      if (value is Map<String, dynamic>) {
        write(json: value, iteration: iteration + 1);
      } else if (value is List) {
        print('${prefix.replaceFirst(' ↪ ', '')}  [');
        for (final item in value) {
          if (item is Map<String, dynamic>) {
            write(json: item, iteration: iteration + 1);
          } else {
            print('  ${prefix}value: $item');
          }
        }
        print('${prefix.replaceFirst(' ↪ ', '')}  ]');
      } else {
        print('  $prefix value: $value');
      }
    }
  }
}
