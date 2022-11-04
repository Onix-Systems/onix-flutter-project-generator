import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/data/model/local/colored_line.dart';

class BuildOutput extends StatelessWidget {
  BuildOutput({Key? key, required this.outputStream, required this.outputText})
      : super(key: key);

  final Stream<ColoredLine>? outputStream;
  List<ColoredLine> outputText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(10),
            child: SizedBox.expand(
              child: StreamBuilder<ColoredLine>(
                stream: outputStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (outputText.last.tag == '{#progress}') {
                      Future.delayed(const Duration(microseconds: 10), () {
                        outputText.removeLast();
                      });
                    }
                    var output = SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: outputText,
                      ),
                    );
                    return output;
                  }
                  return const Text('');
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
