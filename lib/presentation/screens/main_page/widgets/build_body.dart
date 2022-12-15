import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:onix_flutter_bricks/data/model/local/colored_line.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/utils/platforms_list.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/build_output.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/platforms_selector.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/signing_dialog.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_checkbox.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_segmented_control.dart';
import 'package:onix_flutter_bricks/presentation/widgets/switch_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widgets/text_field_with_label.dart';
import 'package:process_run/shell.dart';
import 'package:recase/recase.dart';

import '../../../../core/di/di.dart';
import '../../../../utils/utils.dart';

part '../utils/flutter_project_gen.dart';

class BuildBody extends StatelessWidget {
  BuildBody({
    Key? key,
    required this.projectPath,
    required this.projectName,
    required this.projectNameController,
    required this.onGenerate,
  }) : super(key: key) {
    init();
  }

  String projectPath;
  String projectName;
  final TextEditingController projectNameController;
  final VoidCallback onGenerate;

  bool isGenerating = false;

  String orgName = 'com.example';
  bool flavorize = true;
  Set<String> flavors = {};

  List<String> routers = ['goRouter', 'autoRouter'];
  String router = '';

  List<String> localizators = ['Intl', 'flutter_gen'];
  String localization = '';

  bool generateSigningKey = true;
  bool useSonar = true;
  bool integrateDevicePreview = false;

  final FocusNode projectNameFocusNode = FocusNode();
  final TextEditingController organizationController = TextEditingController();
  final FocusNode organizationFocusNode = FocusNode();
  final TextEditingController flavorsController = TextEditingController();
  final FocusNode flavorsFocusNode = FocusNode();
  bool projectExists = false;

  final outputStreamController = StreamController<ColoredLine>();
  late final Stream<ColoredLine> outputStream =
      outputStreamController.stream.asBroadcastStream();
  List<ColoredLine> outputText = [];

  final platformsStreamController = StreamController<PlatformsList>();
  late final Stream<PlatformsList> platformsStream;

  List<String> signingVars = [
    'Some developer',
    'Flutter dep',
    'Onix-Systems',
    'Kropyvnytskyi',
    'Kirovohrad oblast',
    'UA'
  ];

  void init() {
    router = routers.first;
    localization = localizators.first;
    platformsStream = platformsStreamController.stream.asBroadcastStream();
    organizationController.text = orgName;
    _isProjectExist();

    organizationController.addListener(() {
      orgName = organizationController.text;
    });

    platformsStream.listen((event) {
      logger.d(event);
    });

    outputStream.listen((event) {
      outputText.add(event);
    });
  }

  void _isProjectExist() {
    Directory('$projectPath/$projectName').exists().then((value) {
      if (projectExists != value) {
        projectExists = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 440,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFieldWithLabel(
                  label: 'Project name:',
                  textController: projectNameController,
                  focusNode: projectNameFocusNode,
                  error: projectExists,
                  onSubmitted: () {
                    projectName = projectNameController.text.snakeCase;
                    projectNameController.text = projectName;
                  },
                ),
                const SizedBox(height: 20),
                TextFieldWithLabel(
                  label: 'Organization:',
                  textController: organizationController,
                  focusNode: organizationFocusNode,
                  snakeCase: false,
                  onSubmitted: () {
                    orgName = organizationController.text.toLowerCase();
                    organizationController.text = orgName;
                    logger.i(orgName);
                  },
                ),
                const SizedBox(height: 20),
                PlatformSelector(
                  controller: platformsStreamController,
                ),
                const SizedBox(height: 20),
                SwitchWithLabel(
                  label: 'Flavorize?',
                  initialValue: flavorize,
                  subLabel: '(DEV & PROD flavors will be added automatically)',
                  valueSetter: (value) {
                    flavorize = value;
                  },
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: flavorize,
                  child: TextFieldWithLabel(
                    label: 'Add flavors:',
                    subLabel: '(space separated)',
                    textController: flavorsController,
                    focusNode: flavorsFocusNode,
                    toSet: true,
                    onSubmitted: () {
                      flavors =
                          flavorsController.text.paramCase.split('-').toSet();
                      flavors
                        ..remove('dev')
                        ..remove('prod');
                      flavorsController.text = flavors
                          .toString()
                          .replaceAll('{', '')
                          .replaceAll('}', '')
                          .replaceAll(',', '');
                    },
                  ),
                ),
                const SizedBox(height: 20),
                LabeledSegmentedControl(
                  label: 'Router:',
                  values: routers,
                  onChange: (value) {
                    router = value;
                  },
                ),
                const SizedBox(height: 20),
                LabeledSegmentedControl(
                  label: 'Localization:',
                  values: localizators,
                  onChange: (value) {
                    localization = value;
                  },
                ),
                const SizedBox(height: 20),
                SwitchWithLabel(
                  label: 'Generate signing key?',
                  initialValue: generateSigningKey,
                  subLabel: '(Dialog will open in separate window)',
                  valueSetter: (value) {
                    generateSigningKey = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () async {
                        signingVars = await showCupertinoModalPopup<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) =>
                              SigningDialog(vars: signingVars),
                        ) as List<String>;
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text('Modify signing vars...'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SwitchWithLabel(
                  label: 'Will you use Sonar?',
                  initialValue: useSonar,
                  valueSetter: (value) {
                    useSonar = value;
                  },
                ),
                const SizedBox(height: 20),
                SwitchWithLabel(
                  label: 'Integrate Device Preview?',
                  initialValue: integrateDevicePreview,
                  valueSetter: (value) {
                    integrateDevicePreview = value;
                  },
                ),
                const Spacer(),
                CupertinoButton(
                  color: isGenerating || projectExists
                      ? AppColors.orange.withOpacity(0.03)
                      : AppColors.orange,
                  child: Text(
                    'Generate!',
                    style: TextStyle(
                        color: isGenerating || projectExists
                            ? AppColors.inactiveText
                            : CupertinoColors.black),
                  ),
                  onPressed: onGenerate,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: BuildOutput(
              outputStream: outputStream,
              outputText: outputText,
            ),
          ),
        ],
      ),
    );
  }
}
