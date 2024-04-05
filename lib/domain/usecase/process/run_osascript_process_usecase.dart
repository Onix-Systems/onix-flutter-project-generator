import 'dart:convert';
import 'dart:io';
import 'package:onix_flutter_bricks/domain/usecase/output/add_output_message_usecase.dart';


class RunOsaScriptProcessUseCase {
  final AddOutputMessageUseCase _addOutputMessageUseCase;

  RunOsaScriptProcessUseCase(this._addOutputMessageUseCase);

  Future<int> call({
    required String workDir,
  }) async {
    final process = await Process.start(
      'osascript',
      [
        '-e',
        '''tell application "Terminal"
  set T to do script "cd '$workDir' && flutterfire config"
	set targetWindow to window 1
	activate targetWindow
	set custom title of targetWindow to "flutterfire"
	delay 2
	repeat
		delay 1
		if not busy of T then exit repeat
	end repeat
	close (every window whose name contains "flutterfire")
end tell'''
      ],
      workingDirectory: workDir,
    );

    process.stdout
        .transform(utf8.decoder)
        .listen((event) => _addOutputMessageUseCase(message: event));

    return process.exitCode;
  }
}
