import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';

class SigningDialog extends StatelessWidget {
  SigningDialog({Key? key, required this.state}) : super(key: key);

  AppState state;

  final _nameController = TextEditingController();
  final _orgUnitController = TextEditingController();
  final _orgController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _passwordController = TextEditingController();

  void _init(BuildContext context) {
    _nameController.text = state.signingVars[0];
    _orgUnitController.text = state.signingVars[1];
    _orgController.text = state.signingVars[2];
    _cityController.text = state.signingVars[3];
    _stateController.text = state.signingVars[4];
    _countryController.text = state.signingVars[5];
    _passwordController.text = state.signingVars[6];
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
        title: const Text('Signing vars'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Text(
              ' First & last name',
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _nameController,
              autofocus: true,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]')),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              ' Organizational unit',
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _orgUnitController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]')),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              ' Organization',
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _orgController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[-a-zA-Z0-9 ]')),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              ' City or Locality',
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _cityController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              ' State or Province',
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _stateController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              ' Two-letter country code',
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _countryController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.allow(RegExp(r'[A-Z ]')),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              ' Keystore password',
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _passwordController,
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
            child: const Text('Ok'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Future<void> _onOk(BuildContext context) async {
    Navigator.pop(context, [
      _nameController.text.isNotEmpty
          ? _nameController.text
          : state.signingVars[0],
      _orgUnitController.text.isNotEmpty
          ? _orgUnitController.text
          : state.signingVars[1],
      _orgController.text.isNotEmpty
          ? _orgController.text
          : state.signingVars[2],
      _cityController.text.isNotEmpty
          ? _cityController.text
          : state.signingVars[3],
      _stateController.text.isNotEmpty
          ? _stateController.text
          : state.signingVars[4],
      _countryController.text.isNotEmpty
          ? _countryController.text
          : state.signingVars[5],
      _passwordController.text.isNotEmpty
          ? _passwordController.text
          : state.signingVars[6],
    ]);
  }
}
