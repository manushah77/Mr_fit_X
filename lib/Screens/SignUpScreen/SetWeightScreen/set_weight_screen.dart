import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/SetHeightScreen/set_height_screen.dart';
import 'package:mr_fit_x/Widegts/custom_button.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Widegts/colors_constant.dart';

class SetWightScreen extends StatefulWidget {
  const SetWightScreen({super.key});

  @override
  State<SetWightScreen> createState() => _SetWightScreenState();
}

class _SetWightScreenState extends State<SetWightScreen> {
  int _currentFeet = 1;
  int _currentInches = 0;


  // double?  shoulderValue;
  //
  //
  // Future AddDataToSharedPrefrences () async{
  //
  //   shoulderValue = double.parse('${_currentFeet}.${_currentInches}');
  //
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setDouble('Weight', double.parse(shoulderValue.toString()));
  //
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: CustomButton(
          title: 'Next',
          onTap: () {
            Get.to(() => SetHeightScreen(weight: double.parse('${_currentFeet}.${_currentInches}'),));
           },
        ),
      ),
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
              child: Text(
                '1 of 6 Steps',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Container(
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
                      'Select Your Weight',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
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
                    maxValue: 9,
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
    );
  }
}
