import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showDebugToast() {
    Fluttertoast.showToast(
      msg: 'Under development',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  static void showToast(String msg, {Toast toastLength = Toast.LENGTH_LONG}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black54,
      timeInSecForIosWeb: 5,
      fontSize: 16,
    );
  }
}
