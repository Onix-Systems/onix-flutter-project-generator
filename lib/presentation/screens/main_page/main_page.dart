import 'dart:async';
import 'package:async/async.dart' show StreamGroup;

import 'dart:convert';
import 'dart:io';
import 'package:process_run/shell.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_segmented_control.dart';
import 'package:onix_flutter_bricks/presentation/widgets/switch_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widgets/text_field_with_label.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:recase/recase.dart';

//TODO: move logo to TopRight corner, fix output

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
  Set<String> flavors = {};

  List<String> routers = ['goRouter', 'autoRouter'];
  String router = '';

  List<String> localizators = ['Intl', 'flutter_gen'];
  String localization = '';

  bool generateSigningKey = true;
  bool useSonar = true;
  bool integrateDevicePreview = false;

  final TextEditingController projectNameController = TextEditingController();
  final FocusNode projectNameFocusNode = FocusNode();
  final TextEditingController organizationController = TextEditingController();
  final FocusNode organizationFocusNode = FocusNode();
  final TextEditingController flavorsController = TextEditingController();
  final FocusNode flavorsFocusNode = FocusNode();

  //final outputStreamController = StreamController<String>();
  //late final outputStream = outputStreamController.stream;
  Stream<String>? outputStream;
  final pathStreamController = StreamController<String>();
  late final pathStream = pathStreamController.stream;

  String outputText = '';

  bool dialogIsOpen = false;

  @override
  void initState() {
    projectPath = widget.projectPath;
    router = routers.first;
    localization = localizators.first;
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

  // void addLine(String line) {
  //   outputText += '$line\n';
  //   outputStreamController.add(outputText);
  // }

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
                if (outputStream != null)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: StreamBuilder<String>(
                      stream: outputStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          outputText += '${snapshot.data}\n';
                          return Text(
                            outputText,
                            style: const TextStyle(
                              color: CupertinoColors.lightBackgroundGray,
                            ),
                          );
                        }
                        return const Text('');
                      },
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
