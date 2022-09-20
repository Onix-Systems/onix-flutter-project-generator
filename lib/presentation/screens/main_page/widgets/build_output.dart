import 'package:flutter/cupertino.dart';

class BuildOutput extends StatelessWidget {
  BuildOutput({Key? key, required this.outputStream, required this.outputText})
      : super(key: key);

  Stream<String>? outputStream;
  String outputText;

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
            child: outputStream != null
                ? StreamBuilder<String>(
                    stream: outputStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        outputText += '${snapshot.data}\n';
                        return SingleChildScrollView(
                          reverse: true,
                          child: Text(
                            outputText,
                            style: const TextStyle(
                              color: CupertinoColors.lightBackgroundGray,
                            ),
                          ),
                        );
                      }
                      return const Text('');
                    },
                  )
                : const SizedBox.expand(),
          ),
        ),
      ],
    );
  }
}
