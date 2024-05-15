import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/config/output_line.dart';
import 'package:onix_flutter_bricks/presentation/widget/colored_line.dart';

class OutputConsole extends StatefulWidget {
  final Stream<List<OutputLine>> outputStream;

  const OutputConsole({
    required this.outputStream,
    super.key,
  });

  @override
  State<OutputConsole> createState() => _OutputConsoleState();
}

class _OutputConsoleState extends State<OutputConsole> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OutputLine>>(
      stream: widget.outputStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (snapshot.data ?? List.empty())
                  .map(
                    (e) => ColoredLine(line: e),
                  )
                  .toList(),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
