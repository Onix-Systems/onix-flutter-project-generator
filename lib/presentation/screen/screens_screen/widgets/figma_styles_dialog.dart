import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/di/services.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';
import 'package:recase/recase.dart';

class FigmaStylesDialog extends StatefulWidget {
  final String figmaFile;
  final String figmaToken;

  const FigmaStylesDialog({
    required this.figmaFile,
    required this.figmaToken,
    super.key,
  });

  @override
  State<FigmaStylesDialog> createState() => _FigmaStylesDialogState();
}

class _FigmaStylesDialogState extends State<FigmaStylesDialog> {
  final _dialogFocusNode = FocusNode();

  late FocusNode _currentFocusNode;

  @override
  void initState() {
    _currentFocusNode = _dialogFocusNode;
    _currentFocusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _dialogFocusNode,
      onKey: (node, event) {
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
          _onOk(context);
          return KeyEventResult.handled;
        }
        if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
          Navigator.pop(context);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: FutureBuilder<List<AppStyle>>(
            future: figmaService.getStyles(widget.figmaFile, widget.figmaToken),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CupertinoActivityIndicator();
              }
              final colors = snapshot.data?.whereType<AppColorStyle>().toList();
              final textStyles =
                  snapshot.data?.whereType<AppTextStyle>().toList();

              return Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: MediaQuery.sizeOf(context).height * 0.8,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.bgDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Colors:'),
                    const Delimiter.height(10),
                    Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: List.generate(
                          colors?.length ?? 0,
                          (index) => Container(
                            width: 100,
                            height: 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colors?[index]
                                  .color
                                  .withOpacity(colors[index].opacity),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              colors?[index].name.sentenceCase.toLowerCase() ??
                                  '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(
                                    255 - colors![index].r,
                                    255 - colors[index].g,
                                    255 - colors[index].b,
                                    1),
                              ),
                            ),
                          ),
                        )),
                    const Delimiter.height(10),
                    Text('Text styles:'),
                    Expanded(
                      child: ListView.builder(
                        itemCount: textStyles?.length ?? 0,
                        itemBuilder: (context, index) => Text(
                          textStyles?[index].name.sentenceCase ?? '',
                          style: textStyles?[index].getFontStyle(),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _onOk(BuildContext context) async {
    if (true) {
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
    }
  }
}
