import 'package:flutter/material.dart';
import 'package:mr_fit_x/Widegts/colors_constant.dart';

class CustomDialogs {
  static void showSnakcbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      content: Text(
        msg,
        style: TextStyle(color: Colors.white, fontSize: 19),
      ),
      duration: Duration(seconds: 2),
    ));
  }
}