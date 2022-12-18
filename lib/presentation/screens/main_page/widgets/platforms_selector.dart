import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/utils/platforms_list.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_checkbox.dart';

class PlatformSelector extends StatelessWidget {
  const PlatformSelector({required this.platforms, Key? key}) : super(key: key);

  final PlatformsList platforms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: LabeledCheckbox(
                label: 'Android',
                initialValue: platforms.android,
                onAction: () {
                  context.read<AppBloc>().add(PlatformsChange(
                        platforms:
                            platforms.copyWith(android: !platforms.android),
                      ));
                },
              )),
              Expanded(
                  child: LabeledCheckbox(
                label: 'IOS',
                initialValue: platforms.ios,
                onAction: () {
                  context.read<AppBloc>().add(PlatformsChange(
                        platforms: platforms.copyWith(ios: !platforms.ios),
                      ));
                },
              )),
              Expanded(
                  child: LabeledCheckbox(
                label: 'Web',
                initialValue: platforms.web,
                onAction: () {
                  context.read<AppBloc>().add(PlatformsChange(
                        platforms: platforms.copyWith(web: !platforms.web),
                      ));
                },
              )),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: LabeledCheckbox(
                label: 'MacOS',
                initialValue: platforms.macos,
                onAction: () {
                  context.read<AppBloc>().add(PlatformsChange(
                        platforms: platforms.copyWith(macos: !platforms.macos),
                      ));
                },
              )),
              Expanded(
                  child: LabeledCheckbox(
                label: 'Windows',
                initialValue: platforms.windows,
                onAction: () {
                  context.read<AppBloc>().add(PlatformsChange(
                        platforms:
                            platforms.copyWith(windows: !platforms.windows),
                      ));
                },
              )),
              Expanded(
                  child: LabeledCheckbox(
                label: 'Linux',
                initialValue: platforms.linux,
                onAction: () {
                  context.read<AppBloc>().add(PlatformsChange(
                        platforms: platforms.copyWith(linux: !platforms.linux),
                      ));
                },
              )),
            ],
          ),
        ],
      ),
    );
  }
}
