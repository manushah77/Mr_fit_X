import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_fit_x/Model/user_model.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/custom_bottom_bar.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/SetWeightScreen/set_weight_screen.dart';
import 'package:mr_fit_x/Screens/SplashScreen/welcomme_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controller/splash_controller.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  var controller = Get.put(Splash_Controller());

  String? id;
  String? token;

  Future<void> retrieveToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString('id');
      token = prefs.getString('token');
      print("this is id $id");
    });
  }

  UserData userData = UserData();

  Future<UserData> fetchCurrentUser(userId) async {

    final response = await http.post(
        Uri.parse('https://mrfitx.jeuxtesting.com/api/getUser'),
        body: jsonEncode({'userId': userId}),

        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token.toString(),
        });

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);

      // print(jsonBody.toString());

      if (jsonBody['status'] == 'success') {
        final userJson = jsonBody['user'];

        userData = UserData.fromJson(userJson);
        checkUser(userData);
        return checkUser(userData);
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
                Get.offAll(()=>WelcomeScreen());
              });
        throw Exception(jsonBody['message']);
      }
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAll(()=>WelcomeScreen());
      });
      throw Exception(
          'Failed to connect to the API. Error code: ${response.statusCode}');
    }
  }

  checkUser(UserData user) {
    print(user.weightLoss);
    if (user.weightLoss == null) {
    Get.offAll(()=>SetWightScreen());
    } else {
      controller.retrieveToken().then((value) {
        print(" i am token Function");
        controller.fetchCurrentUser(id);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      retrieveToken().then((value) {
       fetchCurrentUser(id);
      });

    });
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/app_background.png'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Image.asset('assets/images/logo_splash.png',scale: 5,),
        ),
      ),
    );
  }
}
