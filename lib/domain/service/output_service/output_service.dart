import 'dart:async';

import 'package:onix_flutter_bricks/domain/service/output_service/colored_line.dart';

class OutputService {
  final _outputController = StreamController<ColoredLine>();

  late final Stream<ColoredLine> _outputStream;

  Stream<ColoredLine> get outputStream => _outputStream;

  List<ColoredLine> outputLines = [];

  OutputService() {
    _outputStream = _outputController.stream.asBroadcastStream();
  }

  void add(String output) {
    _outputController.add(ColoredLine(line: output));
    outputLines.add(ColoredLine(line: output));
  }

  void clear() {
    outputLines.clear();
  }
}
