import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/utils/platforms_list.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_checkbox.dart';

class PlatformSelector extends StatelessWidget {
  PlatformSelector({required this.state, Key? key}) : super(key: key);

  final AppState state;

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
                initialValue: state.platforms.android,
                onAction: () {
                  context.read<AppBloc>().add(PlatformsChange(
                        platforms: state.platforms.copyWith(
                          android: !state.platforms.android,
                        ),
                      ));
                },
              )),
              Expanded(
                  child: LabeledCheckbox(
                label: 'IOS',
                initialValue: state.platforms.ios,
                onAction: () {
                  context.read<AppBloc>().add(PlatformsChange(
                        platforms: state.platforms.copyWith(
                          android: !state.platforms.ios,
                        ),
                      ));
                },
              )),
              Expanded(
                  child: LabeledCheckbox(
                label: 'Web',
                initialValue: state.platforms.web,
                onAction: () {
                  context.read<AppBloc>().add(PlatformsChange(
                        platforms: state.platforms.copyWith(
                          android: !state.platforms.web,
                        ),
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
                initialValue: state.platforms.macos,
                onAction: () {
                  context.read<AppBloc>().add(PlatformsChange(
                        platforms: state.platforms.copyWith(
                          android: !state.platforms.macos,
                        ),
                      ));
                },
              )),
              Expanded(
                  child: LabeledCheckbox(
                label: 'Windows',
                initialValue: state.platforms.windows,
                onAction: () {
                  context.read<AppBloc>().add(PlatformsChange(
                        platforms: state.platforms.copyWith(
                          android: !state.platforms.windows,
                        ),
                      ));
                },
              )),
              Expanded(
                  child: LabeledCheckbox(
                label: 'Linux',
                initialValue: state.platforms.linux,
                onAction: () {
                  context.read<AppBloc>().add(PlatformsChange(
                        platforms: state.platforms.copyWith(
                          android: !state.platforms.linux,
                        ),
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
