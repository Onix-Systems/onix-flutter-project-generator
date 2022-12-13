import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/utils/platforms_list.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_checkbox.dart';

class PlatformSelector extends StatelessWidget {
  PlatformSelector({required this.controller, Key? key}) : super(key: key);

  final StreamController<PlatformsList> controller;

  PlatformsList _platformsList = const PlatformsList();

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
                initialValue: _platformsList.android,
                onAction: () {
                  _platformsList = _platformsList.copyWith(
                    android: !_platformsList.android,
                  );
                  controller.add(_platformsList);
                },
              )),
              Expanded(
                  child: LabeledCheckbox(
                label: 'IOS',
                initialValue: _platformsList.ios,
                onAction: () {
                  _platformsList = _platformsList.copyWith(
                    ios: !_platformsList.ios,
                  );
                  controller.add(_platformsList);
                },
              )),
              Expanded(
                  child: LabeledCheckbox(
                label: 'Web',
                initialValue: _platformsList.web,
                onAction: () {
                  _platformsList = _platformsList.copyWith(
                    web: !_platformsList.web,
                  );
                  controller.add(_platformsList);
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
                initialValue: _platformsList.macos,
                onAction: () {
                  _platformsList = _platformsList.copyWith(
                    macos: !_platformsList.macos,
                  );
                  controller.add(_platformsList);
                },
              )),
              Expanded(
                  child: LabeledCheckbox(
                label: 'Windows',
                initialValue: _platformsList.windows,
                onAction: () {
                  _platformsList = _platformsList.copyWith(
                    windows: !_platformsList.windows,
                  );
                  controller.add(_platformsList);
                },
              )),
              Expanded(
                  child: LabeledCheckbox(
                label: 'Linux',
                initialValue: _platformsList.linux,
                onAction: () {
                  _platformsList = _platformsList.copyWith(
                    linux: !_platformsList.linux,
                  );
                  controller.add(_platformsList);
                },
              )),
            ],
          ),
        ],
      ),
    );
  }
}
