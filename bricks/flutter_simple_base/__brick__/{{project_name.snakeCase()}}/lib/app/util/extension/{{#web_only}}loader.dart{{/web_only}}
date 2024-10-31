import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

extension ProgressLoader on BuildContext {
  void progressShow() => Loader.show(
        this,
        overlayColor: Colors.transparent,
        progressIndicator: const CupertinoActivityIndicator(),
      );

  void progressHide() => Loader.hide();
}
