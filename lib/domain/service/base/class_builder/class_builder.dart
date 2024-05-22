import 'package:flutter/foundation.dart';

class ClassBuilder {
  @protected
  final List<String> lines = List<String>.empty(growable: true);

  String build() => lines.join('\n');
}
