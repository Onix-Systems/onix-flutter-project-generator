import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:recase/recase.dart';

abstract class AppStyle {
  final String id;
  String name;

  AppStyle({
    required this.id,
    required this.name,
  });

  bool validate() {
    var valid = true;
    var newName = name;

    if (!AppConsts.figmaStylesFirstCharValidChars
        .contains(name.split('').first)) {
      newName = 'style $newName';
    }

    if (name
        .split('')
        .any((element) => !AppConsts.figmaStylesValidChars.contains(element))) {
      for (var i = 0; i < name.length; i++) {
        if (!AppConsts.figmaStylesValidChars.contains(name[i])) {
          newName = newName.replaceFirst(name[i], ' ');
        }
      }
    }

    newName = newName.trim().replaceAll(RegExp(r'\s+|\s'), ' ');

    if (newName == 'style' ||
        newName == 'style Dark' ||
        newName == 'style Light') {
      valid = false;
    } else {
      name = newName.camelCase;
    }

    return valid;
  }
}
