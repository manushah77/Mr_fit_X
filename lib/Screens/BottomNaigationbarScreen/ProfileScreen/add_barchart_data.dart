import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/custom_bottom_bar.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/SetHeightScreen/set_height_screen.dart';
import 'package:mr_fit_x/Widegts/custom_button.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Widegts/colors_constant.dart';

class AddBarChartDataScreen extends StatefulWidget {
  const AddBarChartDataScreen({super.key});

  @override
  State<AddBarChartDataScreen> createState() => _AddBarChartDataScreenState();
}

class _AddBarChartDataScreenState extends State<AddBarChartDataScreen> {
  int _currentFeet = 0;
  int _currentInches = 0;

  int _currentChestFeet = 0;
  int _currentChestInches = 0;

  int _currenAbstFeet = 0;
  int _currentAbsInches = 0;

  int _currentHipsFeet = 0;
  int _currentHipsInches = 0;


  double?  shoulderValue;
  double? chestValue;
  double? absValue;
  double? hipValue;

 Future AddDataToSharedPrefrences () async{

     shoulderValue = double.parse('${_currentFeet}.${_currentAbsInches}');
     chestValue = double.parse('${_currentChestFeet}.${_currentChestInches}');
     absValue = double.parse('${_currenAbstFeet}.${_currentAbsInches}');
     hipValue = double.parse('${_currentHipsFeet}.${_currentHipsInches}');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('Shoulder', double.parse(shoulderValue.toString()));
    prefs.setDouble('Chest', double.parse(chestValue.toString()));
    prefs.setDouble('Lower Abs', double.parse(absValue.toString()));
    prefs.setDouble('Hips', double.parse(hipValue.toString()));

  }


  void _showNumberPickerDialog(int minValue, int maxValue) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setStatee) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: primaryColorYellow,decoration: TextDecoration.underline,fontSize: 16),
                  ),
                ),
              ],
            ),
            content: SizedBox(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Text(
                    '$_currentFeet .$_currentInches',
                    style: TextStyle(color: Colors.white, fontSize: 38),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'kg',
                    // 'Inch',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumberPicker(
                        infiniteLoop: true,
                        selectedTextStyle: TextStyle(
                          color: Color(0xffc6811d),
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle: TextStyle(color: Colors.white54,fontSize: 20),
                        itemWidth: 75,
                        itemHeight: 67,
                        value: _currentFeet.toInt(),
                        minValue: minValue,
                        maxValue: maxValue,
                        onChanged: (value) {
                          setState(() {
                            _currentFeet = value;
                          });
                          setStatee(() {});

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
                            color: Color(0xffc6811d),
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      NumberPicker(
                        infiniteLoop: true,

                        selectedTextStyle: TextStyle(
                          color: Color(0xffc6811d),
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle: TextStyle(color: Colors.white54,fontSize: 20),
                        itemWidth: 75,
                        itemHeight: 67,
                        value: _currentInches.toInt(),
                        minValue: 0,
                        maxValue: 9,
                        onChanged: (value) {
                          setState(() {
                            _currentInches = value;
                          });
                          setStatee(() {});

                          print('Selected inches value is $_currentInches kg');
                        },
                        // textMapper: (value) {
                        //   return '$value kg';
                        // },
                      ),

                      Text('Inch',style: TextStyle(color: Color(0xffc6811d),),)


                    ],
                  ),
                ],
              ),
            ),

          );
        },
      ),
    );
  }
  void _showChestPickerDialog(int minValue, int maxValue) {
    showDialog(
      barrierDismissible: false,

      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setStatee) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: primaryColorYellow,decoration: TextDecoration.underline,fontSize: 16),
                  ),
                ),
              ],
            ),
            content: SizedBox(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Text(
                    '$_currentChestFeet .$_currentChestInches',
                    style: TextStyle(color: Colors.white, fontSize: 38),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Inch',
                    // 'Inch',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumberPicker(
                        infiniteLoop: true,

                        selectedTextStyle: TextStyle(
                          color: Color(0xffc6811d),
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle: TextStyle(color: Colors.white54,fontSize: 20),
                        itemWidth: 75,
                        itemHeight: 67,
                        value: _currentChestFeet.toInt(),
                        minValue: minValue,
                        maxValue: maxValue,
                        onChanged: (value) {
                          setState(() {
                            _currentChestFeet = value;
                          });
                          setStatee(() {});

                          print('Selected feet value is $_currentChestFeet');
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 10,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Color(0xffc6811d),
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      NumberPicker(
                        infiniteLoop: true,

                        selectedTextStyle: TextStyle(
                          color: Color(0xffc6811d),
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle: TextStyle(color: Colors.white54,fontSize: 20),
                        itemWidth: 75,
                        itemHeight: 67,
                        value: _currentChestInches.toInt(),
                        minValue: 0,
                        maxValue: 9,
                        onChanged: (value) {
                          setState(() {
                            _currentChestInches = value;
                          });
                          setStatee(() {});

                          print('Selected inches value is $_currentChestInches kg');
                        },
                        // textMapper: (value) {
                        //   return '$value kg';
                        // },
                      ),

                      Text('Inch',style: TextStyle(color: Color(0xffc6811d),),)


                    ],
                  ),
                ],
              ),
            ),

          );
        },
      ),
    );
  }
  void _showAbsPickerDialog(int minValue, int maxValue) {
    showDialog(
      barrierDismissible: false,

      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setStatee) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: primaryColorYellow,decoration: TextDecoration.underline,fontSize: 16),
                  ),
                ),
              ],
            ),
            content: SizedBox(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Text(
                    '$_currenAbstFeet .$_currentAbsInches',
                    style: TextStyle(color: Colors.white, fontSize: 38),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Inch',
                    // 'Inch',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumberPicker(
                        infiniteLoop: true,

                        selectedTextStyle: TextStyle(
                          color: Color(0xffc6811d),
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle: TextStyle(color: Colors.white54,fontSize: 20),
                        itemWidth: 75,
                        itemHeight: 67,
                        value: _currenAbstFeet.toInt(),
                        minValue: minValue,
                        maxValue: maxValue,
                        onChanged: (value) {
                          setState(() {
                            _currenAbstFeet = value;
                          });
                          setStatee(() {});

                          print('Selected feet value is $_currenAbstFeet');
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 10,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Color(0xffc6811d),
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      NumberPicker(
                        selectedTextStyle: TextStyle(
                          color: Color(0xffc6811d),
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle: TextStyle(color: Colors.white54,fontSize: 20),
                        itemWidth: 75,
                        itemHeight: 67,
                        value: _currentAbsInches.toInt(),
                        minValue: 0,
                        maxValue: 9,
                        onChanged: (value) {
                          setState(() {
                            _currentAbsInches = value;
                          });
                          setStatee(() {});

                          print('Selected inches value is $_currentAbsInches kg');
                        },
                        // textMapper: (value) {
                        //   return '$value kg';
                        // },
                      ),

                      Text('Inch',style: TextStyle(color: Color(0xffc6811d),),)


                    ],
                  ),
                ],
              ),
            ),

          );
        },
      ),
    );
  }
  void _showHipsPickerDialog(int minValue, int maxValue) {
    showDialog(
      barrierDismissible: false,

      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setStatee) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: primaryColorYellow,decoration: TextDecoration.underline,fontSize: 16),
                  ),
                ),
              ],
            ),
            content: SizedBox(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Text(
                    '$_currentHipsFeet .$_currentHipsInches',
                    style: TextStyle(color: Colors.white, fontSize: 38),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Inch',
                    // 'Inch',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumberPicker(
                        infiniteLoop: true,

                        selectedTextStyle: TextStyle(
                          color: Color(0xffc6811d),
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle: TextStyle(color: Colors.white54,fontSize: 20),
                        itemWidth: 75,
                        itemHeight: 67,
                        value: _currentHipsFeet.toInt(),
                        minValue: minValue,
                        maxValue: maxValue,
                        onChanged: (value) {
                          setState(() {
                            _currentHipsFeet = value;
                          });
                          setStatee(() {});

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
                            color: Color(0xffc6811d),
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      NumberPicker(
                        infiniteLoop: true,

                        selectedTextStyle: TextStyle(
                          color: Color(0xffc6811d),
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle: TextStyle(color: Colors.white54,fontSize: 20),
                        itemWidth: 75,
                        itemHeight: 67,
                        value: _currentHipsInches.toInt(),
                        minValue: 0,
                        maxValue: 9,
                        onChanged: (value) {
                          setState(() {
                            _currentHipsInches = value;
                          });
                          setStatee(() {});

                          print('Selected inches value is $_currentHipsInches kg');
                        },
                        // textMapper: (value) {
                        //   return '$value kg';
                        // },
                      ),

                      Text('Inch',style: TextStyle(color: Color(0xffc6811d),),)


                    ],
                  ),
                ],
              ),
            ),

          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: primaryColorPurple,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Add Measurement',
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/app_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: height * 1.9,
              child: ListView(children: [
                SizedBox(
                  height: 25,
                ),
                buildDrawerItem(
                  onTap: () {
                    _showNumberPickerDialog(0, 100);
                  },
                  clr: Colors.redAccent,
                  btnText:  '${_currentFeet == 0 ? 'ADD' : '$_currentFeet.${_currentInches}' }',
                  label: "Shoulder",
                ),
                SizedBox(height: 20),
                buildDrawerItem(
                  onTap: () {
                    _showChestPickerDialog(0, 100);

                  },
                  clr: primaryColorYellow,
                  label: "Chest",
                  btnText:  '${_currentChestFeet == 0 ? 'ADD' : '$_currentChestFeet.${_currentChestInches}'  }',
                ),
                SizedBox(height: 20),
                buildDrawerItem(
                  onTap: () {
                    _showAbsPickerDialog(0, 100);

                  },
                  clr: primaryColorBlue,
                  label: "Lower Abs",
                  btnText:  '${_currenAbstFeet == 0 ? 'ADD' : '$_currenAbstFeet.${_currentAbsInches}'  }',

                ),
                SizedBox(height: 20),
                buildDrawerItem(
                  onTap: () {
                    _showHipsPickerDialog(0, 100);

                  },
                  clr: Colors.deepPurpleAccent.withOpacity(0.8),
                  label: "Hips",
                  btnText:  '${_currentHipsFeet == 0 ? 'ADD' : '$_currentHipsFeet.${_currentHipsInches}' }',

                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    AddDataToSharedPrefrences();
                    Get.off(()=>CustomBottomNavigationBarScreen());
                    Fluttertoast.showToast(
                      msg:
                      "Data Added",
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffc6811d),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Add Measurement',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItem(
      {required String label, Function()? onTap, required Color clr, required String btnText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: 65,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(color: clr, shape: BoxShape.circle),
              ),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color(0xffc6811d),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            btnText,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'IN',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
