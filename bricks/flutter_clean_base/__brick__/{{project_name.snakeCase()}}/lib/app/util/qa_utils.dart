import 'package:{{project_name}}/core/arch/widget/common/toast.dart';
import 'package:{{project_name}}/core/arch/logger/app_logger_impl.dart';
import 'package:{{project_name}}/core/di/remote.dart';
import 'package:flutter/material.dart';

class QaUtils {
  static Widget buildCharlesProxyBtn(_) {
    return const SizedBox();
    //TODO SHOW set proxy ONLY FOR QA BUILDS
    /*if (false */ /*FlavorConfig.I.flavor == Flavors.prod*/ /*) {
      return const SizedBox();
    } else {
      if (!Platform.isAndroid) {
        return const SizedBox();
      }
      return ElevatedButton(
        onPressed: () {
          _setProps(context);
        },
        child: const Text('Set Proxy'),
      );
    }*/
  }

  static void _setProps(BuildContext context) {
    final userInfoKey = GlobalKey<FormState>();
    String? ip;
    String? port;
    final alert = AlertDialog(
      scrollable: true,
      title: const Text('Set CHARLES PROXY'),
      content: Form(
        key: userInfoKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(hintText: 'IP'),
              onChanged: (val) {
                ip = val;
              },
            ),
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(hintText: 'PORT'),
              onChanged: (val) {
                port = val;
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MaterialButton(
              elevation: 10,
              child: const Text(
                'Set proxy',
                textDirection: TextDirection.ltr,
              ),
              onPressed: () {
                if (ip != null && port != null) {
                  logger.d('value: $ip, port: $port');

                  Navigator.of(context, rootNavigator: true).pop(context);
                  CustomToast.showToast('DONE on $ip:$port');
                }
              },
            ),
            MaterialButton(
              elevation: 10,
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(context);
              },
            ),
          ],
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }
}
