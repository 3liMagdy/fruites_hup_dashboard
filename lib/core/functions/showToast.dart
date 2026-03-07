

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> customshowToast(String msg, Color? backgroundColor) async {
    await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor ?? Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }