import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_entity.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_checkbox.dart';
import 'package:recase/recase.dart';

class AddEntityDialog extends StatelessWidget {
  AddEntityDialog({Key? key, this.entity, this.standalone = true})
      : super(key: key);

  final TextEditingController _entityNameController = TextEditingController();
  final EntityEntity? entity;
  final bool standalone;

  bool _createRequest = false;
  bool _createResponse = false;
  bool _createRepository = false;

  @override
  Widget build(BuildContext context) {
    if (entity != null) {
      _entityNameController.text = entity!.name;
      _createRequest = entity!.generateRequest;
      _createResponse = entity!.generateResponse;
      _createRepository = entity!.generateRepository;
    }
    return CupertinoAlertDialog(
      title: entity != null
          ? const Text('Modify entity')
          : const Text('Add entity'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          CupertinoTextField(
            controller: _entityNameController,
            placeholder: 'Entity name',
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
            ],
          ),
          const SizedBox(height: 15),
          LabeledCheckbox(
            label: 'Create request?',
            initialValue:
                entity != null ? entity!.generateRequest : _createRequest,
            onAction: () {
              if (entity != null) {
                entity!.generateRequest = !entity!.generateRequest;
              } else {
                _createRequest = !_createRequest;
              }
            },
          ),
          const SizedBox(height: 15),
          LabeledCheckbox(
            label: 'Create response?',
            initialValue:
                entity != null ? entity!.generateResponse : _createResponse,
            onAction: () {
              if (entity != null) {
                entity!.generateResponse = !entity!.generateResponse;
              } else {
                _createResponse = !_createResponse;
              }
            },
          ),
          if (!standalone) ...[
            const SizedBox(height: 15),
            LabeledCheckbox(
              label: 'Create repository?',
              initialValue: entity != null
                  ? entity!.generateRepository
                  : _createRepository,
              onAction: () {
                if (entity != null) {
                  entity!.generateRepository = !entity!.generateRepository;
                } else {
                  _createRepository = !_createRepository;
                }
              },
            ),
          ],
        ],
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            if (_entityNameController.text.isNotEmpty) {
              if (entity != null) {
                entity!.name = _entityNameController.text.snakeCase;
                Navigator.pop(context, entity);
              } else {
                Navigator.pop(
                    context,
                    EntityEntity(
                        name: _entityNameController.text,
                        generateRequest: _createRequest,
                        generateResponse: _createResponse,
                        generateRepository: _createRepository));
              }
            } else {
              Navigator.pop(context);
            }
          },
          child: const Text('Ok'),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
