import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/config/output_line.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/widget/generation_controls.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/output_console.dart';
import 'package:onix_flutter_bricks/util/stream_util.dart';

class FlavorizrOutput extends StatelessWidget {
  final Stream<List<OutputLine>>? outputStream;
  final bool isGenerating;
  final Config config;
  final VoidCallback onOpenAndroidStudio;
  final VoidCallback onClose;

  const FlavorizrOutput({
    required this.isGenerating,
    required this.config,
    required this.onOpenAndroidStudio,
    required this.onClose,
    this.outputStream,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: context.appColors.darkColor.withOpacity(0.85),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            OutputConsole(
              outputStream: outputStream ?? StreamUtil.emptyStream(),
            ),
            if (!isGenerating)
              Positioned(
                top: 0,
                right: 0,
                child: GenerationControls(
                  onOpenAndroidStudio: onOpenAndroidStudio,
                  config: config,
                  onClose: onClose,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
