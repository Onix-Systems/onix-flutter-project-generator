import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_style.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/figma_styles_dialog.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class FigmaDialog extends StatefulWidget {
  const FigmaDialog({
    super.key,
  });

  @override
  State<FigmaDialog> createState() => _FigmaDialogState();
}

class _FigmaDialogState extends State<FigmaDialog> {
  final TextEditingController _figmaFileController = TextEditingController();
  final TextEditingController _figmaTokenController = TextEditingController();

  final _dialogFocusNode = FocusNode();
  final _figmaFileFieldFocusNode = FocusNode();
  final _figmaTokenFieldFocusNode = FocusNode();

  late FocusNode _currentFocusNode;

  @override
  void initState() {
    _currentFocusNode = _figmaFileFieldFocusNode;
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
      child: CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            S.of(context).getStylesFromFigma,
            style: context.appTextStyles.fs18,
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoTextField(
              controller: _figmaFileController,
              focusNode: _figmaFileFieldFocusNode,
              style: context.appTextStyles.fs18,
              onTap: () {
                setState(() {
                  _currentFocusNode = _figmaFileFieldFocusNode;
                  _figmaFileFieldFocusNode.requestFocus();
                });
              },
              onSubmitted: (_) => _onOk(context),
              placeholder: S.of(context).figmaFileKey,
            ),
            const Delimiter.height(10),
            CupertinoTextField(
              controller: _figmaTokenController,
              focusNode: _figmaTokenFieldFocusNode,
              style: context.appTextStyles.fs18,
              onTap: () {
                setState(() {
                  _currentFocusNode = _figmaTokenFieldFocusNode;
                  _figmaTokenFieldFocusNode.requestFocus();
                });
              },
              onSubmitted: (_) => _onOk(context),
              placeholder: S.of(context).figmaToken,
            ),
          ],
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => _onOk(context),
            child: Text(S.of(context).ok),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(S.of(context).cancel),
          ),
        ],
      ),
    );
  }

  Future<void> _onOk(BuildContext context) async {
    if (_figmaFileController.text.isNotEmpty &&
        _figmaTokenController.text.isNotEmpty) {
      showCupertinoModalPopup<List<AppStyle>>(
        context: context,
        barrierDismissible: false,
        builder: (context) => FigmaStylesDialog(
          figmaFile: _figmaFileController.text,
          figmaToken: _figmaTokenController.text,
        ),
      ).then((styles) {
        if (styles != null && styles.isNotEmpty) {
          context.pop(styles);
        }
      });
    } else {
      context.pop(<AppStyle>[]);
    }
  }
}
