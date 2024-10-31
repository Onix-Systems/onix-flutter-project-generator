import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:process_run/process_run.dart';

extension ProcessOutput on Process {
  Future<void> toOutputService(OutputService outputService) async {
    await outLines.forEach(outputService.add);
    await errLines.forEach((line) => outputService.add('{#error}$line'));
  }
}
