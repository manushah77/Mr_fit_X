import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_fit_x/Screens/LoginScreen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/BottomNaigationbarScreen/custom_bottom_bar.dart';
import '../service/service.dart';

class Splash_Controller extends GetxController {
  RxString token = "".obs;
  RxString status = "".obs;
  Future<void> retrieveToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("token") == null) {
      token.value = "";
    } else {
      token.value = prefs.getString('token')!;
      // status.value = prefs.getString('status')!;
    }
  }

  fetchCurrentUser(var id) async {

    Map data = {"userId": id.toString()};

    await UserService().postwithToken("api/getUser",data,token.toString()).then((value) {
      print(value);
      if (value["status"] == "success") {
        if (value["user"]["status"] == "1" && token.value != null && token.value != '') {
          Get.offAll(() => CustomBottomNavigationBarScreen());
        } else if (value["user"]["status"] == "0") { // Check for user status here
          Get.offAll(() => LoginScreen());
          Get.snackbar(
            "Blocked by Admin",
            "You are blocked by the admin.",
            icon: Icon(Icons.block),
            duration: Duration(seconds: 3),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.grey.withOpacity(0.5),
          );
        } else {
          // Handle other cases if needed
        }
      } else {
        throw Exception('Failed to connect to the API. Error code: ');
      }
    }).catchError((error) {
      // Handle the error from fetchCurrentUser() here

      Get.offAll(() => LoginScreen());
      // CustomDialogs.showSnackbar(context, 'You are blocked by Admin');
    });
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
