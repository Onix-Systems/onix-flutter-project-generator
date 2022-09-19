import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_segmented_control.dart';
import 'package:onix_flutter_bricks/presentation/widgets/switch_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widgets/text_field_with_label.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:recase/recase.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.projectPath}) : super(key: key);

  final String projectPath;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String projectPath = '';
  String projectName = 'new_project';
  String orgName = 'com.example';
  bool flavorize = true;
  bool generateSigningKey = true;
  bool useSonar = true;
  bool integrateDevicePreview = false;
  Set<String> flavors = {};

  final TextEditingController projectNameController = TextEditingController();
  final FocusNode projectNameFocusNode = FocusNode();
  final TextEditingController organizationController = TextEditingController();
  final FocusNode organizationFocusNode = FocusNode();
  final TextEditingController flavorsController = TextEditingController();
  final FocusNode flavorsFocusNode = FocusNode();
  final outputStreamController = StreamController<String>();
  late final outputStream = outputStreamController.stream;
  final pathStreamController = StreamController<String>();
  late final pathStream = pathStreamController.stream;

  String outputText = '';

  bool dialogIsOpen = false;

  @override
  void initState() {
    projectPath = widget.projectPath;
    projectNameController.text = projectName;
    organizationController.text = orgName;
    pathStreamController.add(
        '${widget.projectPath.replaceAll('/Volumes/Macintosh HD/Users', '')}/${projectNameController.text}');
    projectNameController.addListener(() {
      pathStreamController.add(
          '${widget.projectPath.replaceAll('/Volumes/Macintosh HD/Users', '')}/${projectNameController.text}');
    });
    super.initState();
  }

  void addLine(String line) {
    outputText += '$line\n';
    outputStreamController.add(outputText);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              buildTop(),
              const Divider(
                thickness: 1,
                height: 40,
                color: CupertinoColors.activeOrange,
              ),
              buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTop() {
    return Row(
      children: [
        CupertinoButton(
          color: AppColors.orange,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          onPressed: () {
            if (!dialogIsOpen) {
              FilePicker.platform
                  .getDirectoryPath(
                dialogTitle: 'Select project folder',
              )
                  .then((value) {
                if (value != null) {
                  projectPath = value;
                  pathStreamController.add(
                      '${value.replaceAll('/Volumes/Macintosh HD/Users', '')}/${projectNameController.text}');
                }
              });
            }
          },
          child: const Text('Change project folder'),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Current project\'s folder: ',
                style: TextStyle(color: CupertinoColors.systemGrey),
              ),
              const SizedBox(height: 2),
              StreamBuilder<String>(
                  stream: pathStream,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data ?? 'null???',
                      style: const TextStyle(color: CupertinoColors.systemGrey),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBody() {
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
                  },
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
                const LabeledSegmentedControl(
                  label: 'Router:',
                  values: ['goRouter', 'autoRouter'],
                ),
                const SizedBox(height: 20),
                const LabeledSegmentedControl(
                  label: 'Localization:',
                  values: ['flutter_gen', 'Intl'],
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
                  color: AppColors.orange,
                  child: const Text('Generate!'),
                  onPressed: () {
                    outputText = '';
                    addLine('''{
'project_name': $projectName,
'organization': $orgName,
'flavorize': $flavorize,
'flavors': $flavors,
'router': '',
'localization': '',
'gen_sign': $generateSigningKey,
'use_sonar': $useSonar,
'integrate_dev_preview': $integrateDevicePreview
}''');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          buildOutput(),
        ],
      ),
    );
  }

  Widget buildOutput() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: CupertinoColors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const SizedBox.expand(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Hero(
                    tag: 'logo',
                    child: SvgPicture.asset('assets/logo.svg'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: StreamBuilder<String>(
                    stream: outputStream,
                    builder: (context, snapshot) => Text(
                      snapshot.data ?? '',
                      style: const TextStyle(
                        color: CupertinoColors.lightBackgroundGray,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
