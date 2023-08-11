import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class SigningDialog extends StatelessWidget {
  final ProjectSettingsScreenState state;

  SigningDialog({required this.state, Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _orgUnitController = TextEditingController();
  final _orgController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _passwordController = TextEditingController();

  void _init(BuildContext context) {
    _nameController.text = state.config.signingVars[0];
    _orgUnitController.text = state.config.signingVars[1];
    _orgController.text = state.config.signingVars[2];
    _cityController.text = state.config.signingVars[3];
    _stateController.text = state.config.signingVars[4];
    _countryController.text = state.config.signingVars[5];
    _passwordController.text = state.config.signingVars[6];
  }

  @override
  Widget build(BuildContext context) {
    _init(context);
    return Focus(
      focusNode: FocusNode(),
      onKey: (node, event) {
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
          _onOk(context);
        }
        if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
          Navigator.pop(context);
        }
        return KeyEventResult.skipRemainingHandlers;
      },
      child: CupertinoAlertDialog(
        title: Text(S.of(context).signingVars),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Text(
              S.of(context).firstLastName,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _nameController,
              style: context.appTextStyles.fs18,
              autofocus: true,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]')),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).organizationalUnit,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _orgUnitController,
              style: context.appTextStyles.fs18,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]')),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              ' ${S.of(context).organization}',
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _orgController,
              style: context.appTextStyles.fs18,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[-a-zA-Z0-9 ]')),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).cityOrLocality,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _cityController,
              style: context.appTextStyles.fs18,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).stateOrProvince,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _stateController,
              style: context.appTextStyles.fs18,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).twoLetterCountryCode,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _countryController,
              style: context.appTextStyles.fs18,
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.allow(RegExp(r'[A-Z ]')),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).keystorePassword,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _passwordController,
              style: context.appTextStyles.fs18,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\d ]')),
              ],
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
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
        ],
      ),
    );
  }

  Future<void> _onOk(BuildContext context) async {
    Navigator.pop(context, [
      _nameController.text.isNotEmpty
          ? _nameController.text
          : state.config.signingVars[0],
      _orgUnitController.text.isNotEmpty
          ? _orgUnitController.text
          : state.config.signingVars[1],
      _orgController.text.isNotEmpty
          ? _orgController.text
          : state.config.signingVars[2],
      _cityController.text.isNotEmpty
          ? _cityController.text
          : state.config.signingVars[3],
      _stateController.text.isNotEmpty
          ? _stateController.text
          : state.config.signingVars[4],
      _countryController.text.isNotEmpty
          ? _countryController.text
          : state.config.signingVars[5],
      _passwordController.text.isNotEmpty
          ? _passwordController.text
          : state.config.signingVars[6],
    ]);
  }
}