import 'package:recase/recase.dart';

extension MyCase on String {
  String orgCase() {
    Iterable<String> strings = split('-');

    strings = strings.map((e) => e.dotCase);

    return strings.join('-');
  }
}
