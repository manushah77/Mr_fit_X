import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/CaloriesScreen/carbs_screen.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/SetHeightScreen/set_height_screen.dart';
import 'package:mr_fit_x/Widegts/custom_button.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../../Widegts/colors_constant.dart';

class CaloriesScreen extends StatefulWidget {
  const CaloriesScreen({super.key});

  @override
  State<CaloriesScreen> createState() => _CaloriesScreenState();
}

class _CaloriesScreenState extends State<CaloriesScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime? picked;

  Future<void> _selectDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      helpText: 'Select date to show data',

      lastDate: DateTime(DateTime.now().year + 20),
        builder: (BuildContext context, Widget ?child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.grey,
              splashColor: Colors.black,
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: primaryColor, // button text color
                ),
              ),
              colorScheme: ColorScheme.light(
                  primary: Colors.grey,
                  onSecondary: Colors.black,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.white,
                  secondary: Colors.white),
              dialogBackgroundColor: Colors.black,
            ),
            child: child ??Text(""),

          );
        }
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: primaryColorPurple,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Calories',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.white,
                        size: 27,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Color(0xff1f2034), shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        'assets/images/calory_img.png',
                        scale: 10,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Required Cal:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                        color: Colors.white54),
                                  ),
                                  Text(
                                    ' 1,650',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 19,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Gained Cal:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.white54),
                                  ),
                                  Text(
                                    ' 650',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Image.asset(
                            'assets/images/pencil.png',
                            scale: 2.5,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 2,
                              width: 215,
                              decoration: BoxDecoration(
                                color: Color(0xffe6961c),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28),
                  child: Container(
                    width: width / 1,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/images/line.png'),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Protein',
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 17,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '0 g',
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 17,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28),
                  child: Container(
                    width: width / 1,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/images/line.png'),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fats',
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 17,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '0 g',
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 17,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28),
                  child: Container(
                    width: width / 1,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/images/line.png'),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Carbs',
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 17,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '0 g',
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 17,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28),
                  child: Container(
                    width: width / 1,
                    height: 280,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/images/line.png'),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Breakfast',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '0 Cal  ',
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => CarbsAddScreen());
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xffc6811d),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'ADD',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Morning Snack',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '0 Cal  ',
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => CarbsAddScreen());
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xffc6811d),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'ADD',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lunch',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '0 Cal  ',
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => CarbsAddScreen());
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xffc6811d),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'ADD',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Evening Snack',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '0 Cal  ',
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => CarbsAddScreen());
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xffc6811d),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'ADD',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Dinner',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '0 Cal  ',
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => CarbsAddScreen());
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xffc6811d),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'ADD',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
