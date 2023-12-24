import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/ProfileScreen/SetPlanScreen/set_plan_screen.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/ProfileScreen/add_barchart_data.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/ProfileScreen/barchat.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/SetHeightScreen/set_height_screen.dart';
import 'package:mr_fit_x/Widegts/bmi_widget.dart';
import 'package:mr_fit_x/Widegts/body_compansition_chart.dart';
import 'package:mr_fit_x/Widegts/custom_button.dart';
import 'package:mr_fit_x/Widegts/die_plan_conatiner.dart';
import 'package:mr_fit_x/Widegts/glass_widget.dart';
import 'package:mr_fit_x/Widegts/gym_calender.dart';
import 'package:mr_fit_x/Widegts/studio_member_ship_container.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../Widegts/colors_constant.dart';
import '../../../Widegts/bmr_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedGlassIndex = 0;

  String categoryName = 'Shoulder';

  List<String> btnCateogories = [
    'Shoulder',
    'Chest',
    'Lower Abs',
    'Hips',
  ];

  List<Color> buttonColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
  ];

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
        child: Column(
          children: [
            Container(
              height: height * 0.8,
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _showImageDialog();
                          },
                          child: Container(
                            height: 100,
                            child: Stack(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    color: Color(0xff1f2034),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/logo_splash.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Positioned(
                                  top: 65,
                                  left: 30,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: Color(0xffe6961c),
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/pencil.png',
                                        scale: 2.5,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Zohaib Amin',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Text(
                              'zg@gmail.com',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white54),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Row(
                      children: [
                        Text(
                          'Time Remaining ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        Text(
                          '(In Next Session)',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.white54),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      '09 : 55 : 55 ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: GymCalender(),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //glass container

                  GlassWidget(),

                  SizedBox(
                    height: 20,
                  ),

                  //body composition Chart

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: BodyCompansitionChart(),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //BMI container

                  BmiWidget(
                    ontap: () {
                      _showWieghttDialog(0, 300);
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //BMR container

                  BmrWidget(
                    ontap: () {
                      _showheightDialog(0, 11);
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //graph

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      width: width / 1,
                      height: 365,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images/line.png'),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => AddBarChartDataScreen());
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 80,
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
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: BarChartSample(
                              category: categoryName == 'Shoulder'
                                  ? btnCateogories[0]
                                  : categoryName,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 25,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    categoryName = btnCateogories[index];

                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: 7.0, left: 7),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: categoryName ==
                                                  btnCateogories[index]
                                              ? buttonColors[index]
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.white, width: 1)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Center(
                                          child: Text(
                                            btnCateogories[index].toString(),
                                            style: TextStyle(
                                              color: categoryName ==
                                                      btnCateogories[index]
                                                  ? Colors.white
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: btnCateogories.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //diet plan container

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: InkWell(
                      onTap: () {
                        _showMyPersonalDialog();
                      },
                      child: DietPlanContainer(),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // studio member ship

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => SetPlanScreen());
                      },
                      child: studioMembershipContiner(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _currentFeet = 0;
  int _currentInches = 0;

  int _currentHeightFeet = 0;
  int _currentHeightInches = 0;

  File? imageOne;
  final pickerOne = ImagePicker();

  //dialog

  void _showMyPersonalDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        var width = MediaQuery.of(context).size.width;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 180,
            width: 330,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff3b1b4b),
                    primaryColorPurple,
                    primaryColorPurple,
                    primaryColorPurple,
                    Color(0xff3b1b4b),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Diet Plan',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Text(
                      'Please consult Mr.Zohaib',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: primaryColorYellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 47,
                          width: 250,
                          decoration: BoxDecoration(
                              color: primaryColorYellow,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Close',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //pick image dialog

  Future<void> _showImageDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        var width = MediaQuery.of(context).size.width;

        return AlertDialog(
          backgroundColor: Color(0xff424242),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Choose',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          content: SizedBox(
            height: 100,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        var pickImage = await pickerOne.pickImage(
                          source: ImageSource.camera,
                          maxHeight: 1080,
                          maxWidth: 1080,
                        );
                        if (pickImage != null) {
                          // Crop the selected image
                          CroppedFile? croppedImage =
                              await ImageCropper().cropImage(
                            sourcePath: pickImage.path,
                          );

                          if (croppedImage != null) {
                            setState(() {
                              imageOne = File(croppedImage
                                  .path); // Convert CroppedFile to File
                            });
                          }
                        } else {
                          print('No image selected');
                        }
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/camera.png',
                            color: Colors.white,
                            scale: 1.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        var pickImage = await pickerOne.pickImage(
                          source: ImageSource.gallery,
                          maxHeight: 1080,
                          maxWidth: 1080,
                        );
                        if (pickImage != null) {
                          // Crop the selected image
                          CroppedFile? croppedImage =
                              await ImageCropper().cropImage(
                            sourcePath: pickImage.path,
                          );

                          if (croppedImage != null) {
                            setState(() {
                              imageOne = File(croppedImage
                                  .path); // Convert CroppedFile to File
                            });
                          }
                        } else {
                          print('No image selected');
                        }
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/gal.png',
                            color: Colors.white,
                            scale: 2.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 22.0, bottom: 15),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white54),
                  ),
                )),
          ],
        );
      },
    );
  }

  //bmi weight dilaog

  void _showWieghttDialog(int minValue, int maxValue) {
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                        color: primaryColorYellow,
                        decoration: TextDecoration.underline,
                        fontSize: 16),
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
                            bottom: BorderSide(
                                color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle:
                            TextStyle(color: Colors.white54, fontSize: 20),
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
                            color: Color(0xffc6811d), shape: BoxShape.circle),
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
                            bottom: BorderSide(
                                color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle:
                            TextStyle(color: Colors.white54, fontSize: 20),
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
          );
        },
      ),
    );
  }

  //bmi height dilaog

  void _showheightDialog(int minValue, int maxValue) {
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                        color: primaryColorYellow,
                        decoration: TextDecoration.underline,
                        fontSize: 16),
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
                    '$_currentHeightFeet \' $_currentHeightInches \'\'',
                    style: TextStyle(color: Colors.white, fontSize: 38),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Fit Inch',
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
                            bottom: BorderSide(
                                color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle:
                            TextStyle(color: Colors.white54, fontSize: 20),
                        itemWidth: 75,
                        itemHeight: 67,
                        value: _currentHeightFeet.toInt(),
                        minValue: minValue,
                        maxValue: maxValue,
                        onChanged: (value) {
                          setState(() {
                            _currentHeightFeet = value;
                          });
                          setStatee(() {});

                          print('Selected feet value is $_currentHeightFeet');
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
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Color(0xffc6811d), width: 1.0),
                          ),
                        ),
                        textStyle:
                            TextStyle(color: Colors.white54, fontSize: 20),
                        itemWidth: 75,
                        itemHeight: 67,
                        value: _currentHeightInches.toInt(),
                        minValue: 0,
                        maxValue: 11,
                        onChanged: (value) {
                          setState(() {
                            _currentHeightInches = value;
                          });
                          setStatee(() {});

                          print(
                              'Selected inches value is $_currentHeightInches kg');
                        },
                        // textMapper: (value) {
                        //   return '$value kg';
                        // },
                      ),
                      Text(
                        'Inch',
                        style: TextStyle(
                          color: Color(0xffc6811d),
                        ),
                      )
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
}
