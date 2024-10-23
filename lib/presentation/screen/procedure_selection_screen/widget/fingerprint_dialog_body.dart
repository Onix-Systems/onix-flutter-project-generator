import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/config/fingerprint.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class FingerprintDialogBody extends StatelessWidget {
  final List<Fingerprint> fingerprints;

  const FingerprintDialogBody({
    required this.fingerprints,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          S.of(context).signingToolTitle,
          style: context.appTextStyles.fs18,
        ),
      ),
      content: SizedBox(
        height: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).signingToolSuccessText,
              style: context.appTextStyles.fs18?.copyWith(
                fontSize: 16,
              ),
            ),
            const Delimiter.height(10),
            ...fingerprints.map(
              (item) {
                return Material(
                  color: Colors.transparent,
                  child: ListTile(
                    title: Text(item.value),
                    subtitle: Text(item.type.name.toUpperCase()),
                    titleTextStyle: context.appTextStyles.fs18?.copyWith(
                      fontSize: 16,
                    ),
                    subtitleTextStyle: context.appTextStyles.fs18,
                    trailing: IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        _copyToClipboard(item.value);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(S.of(context).ok),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Future<void> _copyToClipboard(String value) async {
    await Clipboard.setData(ClipboardData(text: value));
  }
}
