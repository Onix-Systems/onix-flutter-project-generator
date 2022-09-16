import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_segmented_control.dart';
import 'package:onix_flutter_bricks/presentation/widgets/switch_with_label.dart';
import 'package:onix_flutter_bricks/presentation/widgets/text_fileld_with_label.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.projectPath}) : super(key: key);

  final String projectPath;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController projectNameController = TextEditingController();
  final FocusNode projectNameFocusNode = FocusNode();
  final TextEditingController organizationController = TextEditingController();
  final FocusNode organizationFocusNode = FocusNode();
  final TextEditingController flavorsController = TextEditingController();
  final FocusNode flavorsFocusNode = FocusNode();

  final TextEditingController outputController = TextEditingController();

  late String? projectPath;

  @override
  void initState() {
    projectNameController.text = 'new_project';
    organizationController.text = 'com.example';
    outputController.text =
        'Selected folder for project: ${widget.projectPath}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                    CupertinoButton(
                      color: AppColors.orange,
                      child: Text(widget.projectPath),
                      onPressed: () async {
                        projectPath =
                            await FilePicker.platform.getDirectoryPath(
                          dialogTitle: 'Select folder where to create project',
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFieldWithLabel(
                      label: 'Project name:',
                      textController: projectNameController,
                      focusNode: projectNameFocusNode,
                      onSubmitted: () {
                        FocusScope.of(context).nextFocus();
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFieldWithLabel(
                      label: 'Organization:',
                      textController: organizationController,
                      focusNode: organizationFocusNode,
                      snakeCase: false,
                    ),
                    const SizedBox(height: 20),
                    const SwitchWithLabel(
                      label: 'Flavorize?',
                      subLabel:
                          '(DEV & PROD flavors will be added automatically)',
                    ),
                    const SizedBox(height: 20),
                    TextFieldWithLabel(
                      label: 'Add flavors:',
                      subLabel: '(space separated)',
                      textController: flavorsController,
                      focusNode: flavorsFocusNode,
                      snakeCase: false,
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
                    const SwitchWithLabel(
                      label: 'Generate signing key?',
                      subLabel: '(Dialog will open in separate window)',
                    ),
                    const SizedBox(height: 20),
                    const SwitchWithLabel(label: 'Will you use Sonar?'),
                    const SizedBox(height: 20),
                    const SwitchWithLabel(label: 'Integrate Device Preview?'),
                    const Spacer(),
                    CupertinoButton(
                      color: AppColors.orange,
                      child: const Text('Generate!'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CupertinoTextField(
                            controller: outputController,
                            readOnly: true,
                            expands: true,
                            minLines: null,
                            maxLines: null,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Hero(
                                  tag: 'logo',
                                  child: SvgPicture.asset('assets/logo.svg'))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
