import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart' show StreamGroup;

import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/build_output.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_segmented_control.dart';
import 'package:onix_flutter_bricks/presentation/widgets/switch_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widgets/text_field_with_label.dart';
import 'package:process_run/shell.dart';
import 'package:recase/recase.dart';

class BuildBody extends StatefulWidget {
  BuildBody(
      {Key? key,
      required this.projectPath,
      required this.projectNameController,
      required this.pathStreamController,
      required this.pathStream})
      : super(key: key);

  String projectPath;
  final pathStreamController;
  final pathStream;
  final TextEditingController projectNameController;

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  late String projectPath;
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

  //final outputStreamController = StreamController<String>();
  //late final outputStream = outputStreamController.stream;
  Stream<String>? outputStream;

  String outputText = '';

  @override
  void initState() {
    projectPath = widget.projectPath;
    router = routers.first;
    localization = localizators.first;
    widget.projectNameController.text = projectName;
    organizationController.text = orgName;
    widget.pathStreamController.add(
        '${widget.projectPath.replaceAll('/Volumes/Macintosh HD/Users', '')}/${widget.projectNameController.text}');
    widget.projectNameController.addListener(() {
      widget.pathStreamController.add(
          '${widget.projectPath.replaceAll('/Volumes/Macintosh HD/Users', '')}/${widget.projectNameController.text}');
    });
    super.initState();
  }

  // void addLine(String line) {
  //   outputText += '$line\n';
  //   outputStreamController.add(outputText);
  // }

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
                  onSubmitted: () {
                    projectName = widget.projectNameController.text.snakeCase;
                    widget.projectNameController.text = projectName;
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
                  onPressed: () async {
                    var configFile = await File('config.json').create();
                    await configFile.writeAsString(jsonEncode({
                      'withUI': true,
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
                    print(configFile.absolute.path);
                    var process = await Process.start(
                        'mason',
                        [
                          'make',
                          'flutter_clean_base',
                          '-c',
                          configFile.absolute.path,
                          '--on-conflict',
                          'overwrite'
                        ],
                        workingDirectory: projectPath);
                    // process
                    //   ..outLines.forEach((element) {
                    //     print(element);
                    //   })
                    //   ..errLines.forEach((element) {
                    //     print(element);
                    //   });
                    setState(() {
                      outputStream = StreamGroup.merge([
                        process.outLines.asBroadcastStream(),
                        process.errLines.asBroadcastStream()
                      ]);
                    });
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
