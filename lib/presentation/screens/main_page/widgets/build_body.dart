import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/data/model/local/colored_line.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/build_output.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/signing_dialog.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_segmented_control.dart';
import 'package:onix_flutter_bricks/presentation/widgets/switch_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widgets/text_field_with_label.dart';
import 'package:process_run/shell.dart';
import 'package:recase/recase.dart';

import '../../../../core/di/di.dart';
import '../../../../utils/utils.dart';

part '../utils/flutter_project_gen.dart';

class BuildBody extends StatefulWidget {
  BuildBody(
      {Key? key,
      required this.projectPath,
      required this.projectNameController,
      required this.pathStreamController,
      required this.pathStream})
      : super(key: key);

  String projectPath;
  final StreamController<String> pathStreamController;
  final Stream<String> pathStream;
  final TextEditingController projectNameController;

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  bool isGenerating = false;

  String projectName = 'new_project';
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

  List<String> signingVars = [
    'Some developer',
    'Flutter dep',
    'Onix-Systems',
    'Kropyvnytskyi',
    'Kirovohrad oblast',
    'UA'
  ];

  @override
  void initState() {
    router = routers.first;
    localization = localizators.first;
    widget.projectNameController.text = projectName;
    organizationController.text = orgName;
    widget.pathStream.listen((event) {
      widget.projectPath = event;
      _isProjectExist();
    });
    _isProjectExist();
    widget.projectNameController.addListener(() {
      projectName = widget.projectNameController.text;
      widget.pathStreamController.add(widget.projectPath);
    });

    outputStream.listen((event) {
      outputText.add(event);
    });

    super.initState();
  }

  @override
  void dispose() {
    organizationController.dispose();
    flavorsController.dispose();
    outputStreamController.close();
    super.dispose();
  }

  void _isProjectExist() {
    Directory('${widget.projectPath}/$projectName').exists().then((value) {
      if (projectExists != value) {
        setState(() {
          projectExists = value;
        });
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
                  textController: widget.projectNameController,
                  focusNode: projectNameFocusNode,
                  error: projectExists,
                  onSubmitted: () {
                    projectName = widget.projectNameController.text.snakeCase;
                    widget.projectNameController.text = projectName;
                  },
                  onChanged: () {},
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
                  },
                  onChanged: () {},
                ),
                const SizedBox(height: 20),
                SwitchWithLabel(
                  label: 'Flavorize?',
                  initialValue: flavorize,
                  subLabel: '(DEV & PROD flavors will be added automatically)',
                  valueSetter: (value) {
                    setState(() {
                      flavorize = value;
                    });
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
                    onChanged: () {},
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
                  onPressed: () async {
                    if (!isGenerating && !projectExists) {
                      outputText.clear();
                      setState(() {
                        isGenerating = true;
                      });
                      if (projectName.isNotEmpty && orgName.isNotEmpty) {
                        var configFile =
                            await File('${widget.projectPath}/config.json')
                                .create();
                        await configFile.writeAsString(jsonEncode({
                          'withUI': true,
                          'signingVars': signingVars,
                          'project_name_dirt': projectName,
                          'project_org': orgName,
                          'flavorizr': flavorize,
                          'flavors': flavors.toList(),
                          'navigation': router,
                          'localization': localization,
                          'use_keytool': generateSigningKey,
                          'use_sonar': useSonar,
                          'device_preview': integrateDevicePreview
                        }).toString());
                        var generatingResult = await flutterProjectGen(
                            projectPath: widget.projectPath,
                            configFile: configFile,
                            projectName: projectName,
                            orgName: orgName,
                            outputText: outputText,
                            outputStreamController: outputStreamController);
                        configFile.delete();
                        setState(() {
                          isGenerating = false;
                          projectExists = true;
                        });
                      } else if (projectName.isEmpty) {
                        FocusScope.of(context)
                            .requestFocus(projectNameFocusNode);
                      } else {
                        FocusScope.of(context)
                            .requestFocus(organizationFocusNode);
                      }
                    }
                  },
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
