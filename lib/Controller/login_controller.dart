import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/custom_bottom_bar.dart';
import 'package:mr_fit_x/Widegts/dialoag_widget.dart';
import 'package:mr_fit_x/service/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/LoginScreen/login_screen.dart';


class login_Controller extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  var passwordReset = GlobalKey<FormState>().obs;
  var logInformKey = GlobalKey<FormState>().obs;
  var isLoading = false.obs;


  loginUser(var userEmail, var userPass,BuildContext context) async {
    try {
      isLoading(true);
      Map data = {
        "email": userEmail.toString(),
        "password": userPass.toString(),
      };
      await UserService().postApi("api/login", data).then((value) async {
        // print(value);
        if (value['status'] == "success") {
          if (value['user']['status'] == "1") {
            String token = value['data']['token'];
            String id = value['user']['id'].toString();
            String status = value['user']['status'].toString();

            // Store the token in SharedPreferences
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('token', token);
            prefs.setString('id', id);
            prefs.setString('status', status);

            // print(' My data is , $token');
            // print(' My iddddd is , $id');
            // print(' My status is , $status');
            email.clear();
            pass.clear();
            Get.offAll(() => CustomBottomNavigationBarScreen());

            CustomDialogs.showSnakcbar(context, '${ value["message"].toString()}');


            // Get.snackbar(
            //   value["status"].toString(),
            //   value["message"].toString(),
            //   icon: Icon(Icons.thumb_up),
            //   duration: Duration(seconds: 3),
            //   snackPosition:
            //   SnackPosition.BOTTOM, // Optional: Position of the snackbar
            //   backgroundColor: Colors.grey.withOpacity(
            //       0.5), // Optional: Background color of the snackbar
            //   // colorText: Colors.white, // Optional: Text color of the snackbar
            // );
          }
          else if (value['user']['status'] == "0") {
            // User is blocked by admin
            email.clear();
            pass.clear();
            CustomDialogs.showSnakcbar(context, 'You are blocked by the admin.');

          }

          else {
            email.clear();
            pass.clear();
            CustomDialogs.showSnakcbar(context, '${ value["message"].toString()}');

          }
        }
        else {
          email.clear();
          pass.clear();
          CustomDialogs.showSnakcbar(context, '${ value["message"].toString()}');

        }
      }
      );
    } finally {
      isLoading(false);
    }
  }

  ressetPass(var userEmail,BuildContext context) async {
    try {
      isLoading(true);
      Map data = {"email": userEmail.toString()};
      await UserService().postApi("api/forgot", data).then((value) {
        // print(value);
        if (value['msg'] == "Reset password link sent on your email id.") {
          email.clear();
          Get.offAll(() => LoginScreen());
          CustomDialogs.showSnakcbar(context, '${ value["msg"].toString()}');

        } else {
          email.clear();
          CustomDialogs.showSnakcbar(context, '${ value["message"].toString()}');

        }
      });
    } finally {
      isLoading(false);
    }
  }

}
