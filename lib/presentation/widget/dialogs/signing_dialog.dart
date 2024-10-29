import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class SigningDialog extends StatefulWidget {
  final List<String> signingVars;

  const SigningDialog({
    required this.signingVars,
    super.key,
  });

  @override
  State<SigningDialog> createState() => _SigningDialogState();
}

class _SigningDialogState extends State<SigningDialog> {
  final _nameController = TextEditingController();
  final _orgUnitController = TextEditingController();
  final _orgController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _varsValid = true;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.signingVars[0];
    _orgUnitController.text = widget.signingVars[1];
    _orgController.text = widget.signingVars[2];
    _cityController.text = widget.signingVars[3];
    _stateController.text = widget.signingVars[4];
    _countryController.text = widget.signingVars[5];
    _passwordController.text = widget.signingVars[6];
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: FocusNode(),
      onKeyEvent: (node, event) {
        if (HardwareKeyboard.instance
            .isLogicalKeyPressed(LogicalKeyboardKey.enter)) {
          _onOk(context);
        }
        if (HardwareKeyboard.instance
            .isLogicalKeyPressed(LogicalKeyboardKey.escape)) {
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
              style: TextStyle(
                color: _nameValid()
                    ? context.appColors.textColor
                    : context.appColors.alarmColor,
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _nameController,
              style: context.appTextStyles.fs18,
              onChanged: (_) => _validate(),
              autofocus: true,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9 ]')),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).organizationalUnit,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: _orgUnitValid()
                    ? context.appColors.textColor
                    : context.appColors.alarmColor,
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _orgUnitController,
              style: context.appTextStyles.fs18,
              onChanged: (_) => _validate(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9 ]')),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              ' ${S.of(context).organization}',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: _orgValid()
                    ? context.appColors.textColor
                    : context.appColors.alarmColor,
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _orgController,
              style: context.appTextStyles.fs18,
              onChanged: (_) => _validate(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[-a-zA-Z0-9 ]')),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).cityOrLocality,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: _cityValid()
                    ? context.appColors.textColor
                    : context.appColors.alarmColor,
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _cityController,
              style: context.appTextStyles.fs18,
              onChanged: (_) => _validate(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).stateOrProvince,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: _stateValid()
                    ? context.appColors.textColor
                    : context.appColors.alarmColor,
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _stateController,
              style: context.appTextStyles.fs18,
              onChanged: (_) => _validate(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).twoLetterCountryCode,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: _countryCodeValid()
                    ? context.appColors.textColor
                    : context.appColors.alarmColor,
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _countryController,
              style: context.appTextStyles.fs18,
              onChanged: (_) => _validate(),
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.allow(RegExp('[A-Z ]')),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).keystorePassword,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: _passwordValid()
                    ? context.appColors.textColor
                    : context.appColors.alarmColor,
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _passwordController,
              placeholder: S.of(context).keyStorePasswordPlaceholder,
              style: context.appTextStyles.fs18,
              onChanged: (_) => _validate(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  AppConsts.digitsAndLatinWithSpaceOnly,
                ),
              ],
            ),
          ],
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => _varsValid ? _onOk(context) : null,
            textStyle: TextStyle(
              color: _varsValid
                  ? context.appColors.controlColor
                  : context.appColors.fadedColor,
            ),
            child: Text(S.of(context).ok),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            textStyle: TextStyle(
              color: context.appColors.controlColor,
            ),
            child: Text(S.of(context).cancel),
          ),
        ],
      ),
    );
  }

  bool _nameValid() {
    return _nameController.text.isNotEmpty;
  }

  bool _orgUnitValid() {
    return _orgUnitController.text.isNotEmpty;
  }

  bool _orgValid() {
    return _orgController.text.isNotEmpty;
  }

  bool _cityValid() {
    return _cityController.text.isNotEmpty;
  }

  bool _stateValid() {
    return _stateController.text.isNotEmpty;
  }

  bool _countryCodeValid() {
    return _countryController.text.isNotEmpty &&
        _countryController.text.length == 2;
  }

  bool _passwordValid() {
    return (_passwordController.text.isNotEmpty &&
            _passwordController.text.length > 5) ||
        _passwordController.text.isEmpty;
  }

  void _validate() {
    setState(() {
      _varsValid = _nameValid() &&
          _orgUnitValid() &&
          _orgValid() &&
          _cityValid() &&
          _stateValid() &&
          _countryCodeValid() &&
          _passwordValid();
    });
  }

  void _onOk(BuildContext context) {
    Navigator.pop(
      context,
      [
        if (_nameController.text.isNotEmpty)
          _nameController.text
        else
          widget.signingVars[0],
        if (_orgUnitController.text.isNotEmpty)
          _orgUnitController.text
        else
          widget.signingVars[1],
        if (_orgController.text.isNotEmpty)
          _orgController.text
        else
          widget.signingVars[2],
        if (_cityController.text.isNotEmpty)
          _cityController.text
        else
          widget.signingVars[3],
        if (_stateController.text.isNotEmpty)
          _stateController.text
        else
          widget.signingVars[4],
        if (_countryController.text.isNotEmpty)
          _countryController.text
        else
          widget.signingVars[5],
        if (_passwordController.text.isNotEmpty)
          _passwordController.text
        else
          widget.signingVars[6],
      ],
    );
  }
}
