import 'dart:async';

import 'package:onix_flutter_bricks/domain/entity/config/output_line.dart';

class OutputService {
  final _outputController = StreamController<OutputLine>();

  late final Stream<OutputLine> _outputStream;

  Stream<OutputLine> get outputStream => _outputStream;

  List<OutputLine> outputLines = [];

  OutputService() {
    _outputStream = _outputController.stream.asBroadcastStream();
  }

  void add(String output) {
    final line = OutputLine.fromRaw(output);
    _outputController.add(line);
    outputLines.add(line);
  }

  void clear() {
    outputLines.clear();
  }
}
