import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/data/model/local/colored_line.dart';

class BuildOutput extends StatelessWidget {
  BuildOutput({
    Key? key,
    required this.outputStream,
    required this.outputText,
    required this.canClose,
  }) : super(key: key);

  final Stream<ColoredLine>? outputStream;
  List<ColoredLine> outputText;
  final bool canClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Stack(children: [
                SizedBox.expand(
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
                if (canClose)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Row(
                      children: [
                        CupertinoButton(
                          color: CupertinoColors.activeOrange,
                          child: const Text(
                            'Open in Android Studio',
                            style: TextStyle(color: CupertinoColors.white),
                          ),
                          onPressed: () {
                            context.read<AppBloc>().add(const OpenProject());
                          },
                        ),
                        const SizedBox(width: 10),
                        CupertinoButton(
                          color: CupertinoColors.activeOrange,
                          padding: EdgeInsets.zero,
                          child: const Icon(
                            CupertinoIcons.clear,
                            color: CupertinoColors.white,
                          ),
                          onPressed: () {
                            context
                                .read<AppBloc>()
                                .add(const GenerateComplete());
                          },
                        ),
                      ],
                    ),
                  ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
