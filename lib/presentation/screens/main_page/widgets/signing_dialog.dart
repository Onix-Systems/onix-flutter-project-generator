import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/widgets/text_field_with_label.dart';

class SigningDialog extends StatefulWidget {
  SigningDialog({Key? key, required this.vars}) : super(key: key);

  List<String> vars;

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

  @override
  void initState() {
    _nameController.text = widget.vars[0];
    _orgUnitController.text = widget.vars[1];
    _orgController.text = widget.vars[2];
    _cityController.text = widget.vars[3];
    _stateController.text = widget.vars[4];
    _countryController.text = widget.vars[5];
    super.initState();
  }

  @override
  void dispose() {
    _countryController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _orgController.dispose();
    _orgUnitController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
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
          ),
          const SizedBox(height: 15),
          const Text(
            ' Organizational unit',
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 5),
          CupertinoTextField(
            controller: _orgUnitController,
          ),
          const SizedBox(height: 15),
          const Text(
            ' Organization',
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 5),
          CupertinoTextField(
            controller: _orgController,
          ),
          const SizedBox(height: 15),
          const Text(
            ' City or Locality',
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 5),
          CupertinoTextField(
            controller: _cityController,
          ),
          const SizedBox(height: 15),
          const Text(
            ' State or Province',
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 5),
          CupertinoTextField(
            controller: _stateController,
          ),
          const SizedBox(height: 15),
          const Text(
            ' Two-letter country code',
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 5),
          CupertinoTextField(
            controller: _countryController,
          ),
        ],
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context, [
              _nameController.text.isNotEmpty
                  ? _nameController.text
                  : widget.vars[0],
              _orgUnitController.text.isNotEmpty
                  ? _orgUnitController.text
                  : widget.vars[1],
              _orgController.text.isNotEmpty
                  ? _orgController.text
                  : widget.vars[2],
              _cityController.text.isNotEmpty
                  ? _cityController.text
                  : widget.vars[3],
              _stateController.text.isNotEmpty
                  ? _stateController.text
                  : widget.vars[4],
              _countryController.text.isNotEmpty
                  ? _countryController.text
                  : widget.vars[5],
            ]);
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
