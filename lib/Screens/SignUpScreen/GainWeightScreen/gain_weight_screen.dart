import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/custom_bottom_bar.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/SetHeightScreen/set_height_screen.dart';
import 'package:mr_fit_x/Widegts/custom_button.dart';
import 'package:mr_fit_x/Widegts/dialoag_widget.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Widegts/colors_constant.dart';
import '../../../Constant/const.dart';
import 'package:http/http.dart' as http;

class GetWightScreen extends StatefulWidget {
  double weight;
  double height;
  String jointData;
  String gymTime;
  String goal;

  GetWightScreen({
    required this.height,
    required this.weight,
    required this.jointData,
    required this.gymTime,
    required this.goal,
  });

  @override
  State<GetWightScreen> createState() => _GetWightScreenState();
}

class _GetWightScreenState extends State<GetWightScreen> {
  int _currentFeet = 1;
  int _currentInches = 0;
  String? token;
  String? id;
  String? email;
  bool isLoading = false;


  Future<void> retrieveToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token');
      id = prefs.getString('id');
      email = prefs.getString('email');
      print("this is token $token");
      print("this is id $id");
      print("this is id $email");
    });
    // print('asdadasda $token');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveToken().then((value) {
      print('asdasd ${widget.weight}');
      print('jhgjh ${widget.height}');
      print('asdasd ${widget.gymTime}');
      print('jhgjh ${widget.jointData}');
      print('jhgjh ${widget.goal}');
    });


  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: width / 2,
              height: 50,
              child: CustomButton(
                title: 'Gain',
                onTap: () {
                  postUserData().then((value) {
                    Get.offAll(() => CustomBottomNavigationBarScreen());

                  });
                },
              ),
            ),
            SizedBox(
              width: width / 2,
              height: 50,
              child: CustomButton(
                title: 'Loss',
                onTap: () {
                  postUserData().then((value) {
                    Get.offAll(() => CustomBottomNavigationBarScreen());

                  });                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
              child: Text(
                '6 of 6 Steps',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/app_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select amount of Weight',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                        Text(
                          'KG',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: primaryColorYellow,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    '$_currentFeet .$_currentInches',
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'kg',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumberPicker(
                        infiniteLoop: true,
                        selectedTextStyle: TextStyle(
                          color: Color(0xffc6811d),
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle: TextStyle(color: Colors.white54, fontSize: 20),
                        itemWidth: 80,
                        itemHeight: 70,
                        value: _currentFeet.toInt(),
                        minValue: 1,
                        maxValue: 100,
                        onChanged: (value) {
                          setState(() {
                            _currentFeet = value;
                          });
                          print('Selected feet value is $_currentFeet');
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 10,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Color(0xffc6811d), shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      NumberPicker(
                        infiniteLoop: true,
                        selectedTextStyle: TextStyle(
                          color: Color(0xffc6811d),
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle: TextStyle(color: Colors.white54, fontSize: 20),
                        itemWidth: 120,
                        itemHeight: 70,
                        value: _currentInches.toInt(),
                        minValue: 0,
                        maxValue: 11,
                        onChanged: (value) {
                          setState(() {
                            _currentInches = value;
                          });
                          print('Selected inches value is $_currentInches kg');
                        },
                        // textMapper: (value) {
                        //   return '$value kg';
                        // },
                      ),
                      Text(
                        'Kg',
                        style: TextStyle(
                          color: Color(0xffc6811d),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: Lottie.asset(
                    'assets/loader.json',
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }


  //user data
  Future<void> postUserData() async {
    String apiUrl = Consts.BASE_URL + '/api/updateUser';

    setState(() {
      isLoading = true;
    });

    // Replace this map with your actual data
    Map<String, dynamic> data = {
      "userId": id.toString(),
      "weight": widget.weight,
      "height": widget.height,
      "selected_package": 'Standard',
      "join_date": widget.jointData,
      "gym_timings": widget.gymTime,
      "goal_of_joining": widget.goal,
      "weight_loss": double.parse('${_currentFeet}.${_currentInches}'),
      "package_id": 1,

      // Add other fields as needed
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          // "Accept": "application/json",
          "Authorization": "Bearer $token",
          "Content-Type": "application/json", // Add Content-Type header
        },
        body: jsonEncode(data),
      );

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        print("POST request successful!");
        CustomDialogs.showSnakcbar(context, 'User Register Successfully');
        print("Response: ${response.body}");
      } else {
        CustomDialogs.showSnakcbar(context, 'Failed to add data');
        throw Exception(
            "Failed to post data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle errors
      print("Error: $e");
      CustomDialogs.showSnakcbar(context, 'Error: $e');
    }
  }



}
