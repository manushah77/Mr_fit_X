import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:mr_fit_x/Constant/const.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/OTP_Screen/otp_screen.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/SetWeightScreen/set_weight_screen.dart';
import 'package:mr_fit_x/Widegts/custom_button.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widegts/colors_constant.dart';
import '../../Widegts/custom_text_field.dart';
import 'package:http/http.dart' as http;

import '../../Widegts/dialoag_widget.dart';
import '../BottomNaigationbarScreen/custom_bottom_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool ispasswordvisible = true;

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController adressC = TextEditingController();

  String selectedCountryCode = '+92'; // Default country code
  int _currentValue = 0;
  int _currentMonthValue = 0;
  int _currentYearValue = 2010;

  void handleCountryChange(Country country) {
    setState(() {
      selectedCountryCode = '+${country.dialCode}';
    });
  }

  void _showNumberPickerDialog(String title, int minValue, int maxValue) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setStatee) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            content: SizedBox(
              height: 200,
              child: NumberPicker(
                selectedTextStyle: TextStyle(
                  color: Color(0xffc6811d),
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.symmetric(
                      horizontal: BorderSide(
                    color: Color(0xffc6811d),
                  )),
                ),
                textStyle: TextStyle(color: Colors.white),
                itemWidth: 80,
                itemHeight: 70,
                value: _currentValue.toInt(),
                minValue: minValue,
                maxValue: maxValue,
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                  setStatee(() {});
                  print('Selected feet value is $_currentValue');
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showMonthNumberPickerDialog(String title, int minValue, int maxValue) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setStatee) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            content: SizedBox(
              height: 200,
              child: NumberPicker(
                selectedTextStyle: TextStyle(
                  color: Color(0xffc6811d),
                  // Replace with your desired color
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.symmetric(
                      horizontal: BorderSide(
                    color: Color(0xffc6811d),
                  )),
                ),
                textStyle: TextStyle(color: Colors.white),
                itemWidth: 80,
                itemHeight: 70,
                value: _currentMonthValue.toInt(),
                minValue: minValue,
                maxValue: maxValue,
                onChanged: (value) {
                  setState(() {
                    _currentMonthValue = value;
                  });
                  setStatee(() {});
                  print('Selected feet value is $_currentMonthValue');
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showYearNumberPickerDialog(String title, int minValue, int maxValue) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setStatee) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            content: SizedBox(
              height: 200,
              child: NumberPicker(
                selectedTextStyle: TextStyle(
                  color: Color(0xffc6811d),
                  // Replace with your desired color
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.symmetric(
                      horizontal: BorderSide(
                    color: Color(0xffc6811d),
                  )),
                ),
                textStyle: TextStyle(color: Colors.white),
                itemWidth: 80,
                itemHeight: 70,
                value: _currentYearValue.toInt(),
                minValue: minValue,
                maxValue: maxValue,
                onChanged: (value) {
                  setState(() {
                    _currentYearValue = value;
                  });
                  setStatee(() {});
                  print('Selected feet value is $_currentYearValue');
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('SADASD $_currentValue');
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Sign Up',
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 25, color: Colors.white),
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
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/app_background.png'),
              fit: BoxFit.cover,
            )),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 100),

                    //image

                    InkWell(
                      onTap: () {
                        _showImageDialog();
                      },
                      child: imageOne != null
                          ? ClipOval(
                              child: Image.file(
                                imageOne!,
                                fit: BoxFit.cover,
                                height: 140,
                                width: 140,
                              ),
                            )
                          : Container(
                              height: 160,
                              child: Stack(
                                children: [
                                  ClipOval(
                                    child: Container(
                                      height: 140,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/place_holder.jpg'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  Positioned(
                                    top: 7,
                                    left: 106,
                                    child: Image.asset(
                                      'assets/icons/add.png',
                                      scale: 5.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //email
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: SizedBox(
                        width: width / 1,
                        height: 65,
                        child: CustomTextField(
                          hintText: 'Email',
                          errorHint: 'Enter email',
                          keyboradType: TextInputType.emailAddress,
                          controller: emailC,
                          validate: true,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    //full name
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: SizedBox(
                        width: width / 1,
                        height: 65,
                        child: CustomTextField(
                          hintText: 'Full Name',
                          errorHint: 'Enter name',
                          controller: nameC,
                          validate: true,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //phone
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: SizedBox(
                        width: width / 1,
                        height: 70,
                        child: IntlPhoneField(
                          showCountryFlag: true,
                          dropdownIcon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                          cursorColor: primaryColor,
                          controller: phoneC,
                          validator: (_) {
                            if (_ == null || _ == '') {
                              return 'Enter number';
                            }

                            if (RegExp(r'\D').allMatches(_.toString()).length <
                                10) {
                              return 'Invalid number, too short';
                            }

                            return null;
                          },
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          dropdownTextStyle: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          dropdownIconPosition: IconPosition.trailing,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            hintTextDirection: TextDirection.rtl,
                            labelStyle: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2),
                            ),
                          ),
                          initialCountryCode: 'PK',
                          onChanged: (value) {},
                          onCountryChanged: handleCountryChange,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    //password
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: SizedBox(
                        width: width / 1,
                        height: 65,
                        child: CustomTextField(
                          hintText: 'Password',
                          validate: true,
                          controller: passwordC,
                          errorHint: 'Enter Password',
                          obsecureText: ispasswordvisible,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                ispasswordvisible = !ispasswordvisible;
                              });
                            },
                            icon: Icon(
                              size: 25,
                              ispasswordvisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //address
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: SizedBox(
                        width: width / 1,
                        height: 65,
                        child: CustomTextField(
                          hintText: 'Address',
                          errorHint: 'Enter address',
                          controller: adressC,
                          validate: true,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Row(
                        children: [
                          Text(
                            'Date 0f Birth',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.white70),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  _showNumberPickerDialog("Day", 0, 31);
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${_currentValue == 0 ? 'Day' : _currentValue}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _showMonthNumberPickerDialog("Month", 0, 12);
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${_currentMonthValue == 0 ? 'Month' : _currentMonthValue}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _showYearNumberPickerDialog(
                                      "Year", 1970, 2013);
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${_currentYearValue == 2010 ? 'Month' : _currentYearValue}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Add similar Expanded widgets for Month and Year
                            ],
                          ),
                        ],
                      ),
                    ),

                    //radio button
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Row(
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                            value: 0,
                            groupValue: _groupValue,
                            title: Text(
                              "Male",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            onChanged: (newValue) =>
                                setState(() => _groupValue = newValue!),
                            activeColor: Colors.orange,
                            selected: true,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              return Colors.orange;
                            }),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                            value: 1,
                            groupValue: _groupValue,
                            title: Text(
                              "Female",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            onChanged: (newValue) =>
                                setState(() => _groupValue = newValue!),
                            activeColor: Colors.orange,
                            selected: false,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              return Colors.orange;
                            }),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                            value: 2,
                            groupValue: _groupValue,
                            title: Text(
                              "Other",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            onChanged: (newValue) =>
                                setState(() => _groupValue = newValue!),
                            activeColor: Colors.orange,
                            selected: false,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              return Colors.orange;
                            }),
                          ),
                        ),
                      ],
                    ),

                    //button

                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      title: 'Sign Up',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          _signUp();
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
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

  File? imageOne;
  final pickerOne = ImagePicker();

  // bool isUploaded = false;

  // void _showBottomSheet() {
  //   showModalBottomSheet(
  //       backgroundColor: Colors.grey,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //           topRight: Radius.circular(20),
  //           topLeft: Radius.circular(20),
  //         ),
  //       ),
  //       context: context,
  //       builder: (_) {
  //         return ListView(
  //           padding: EdgeInsets.only(top: 15),
  //           shrinkWrap: true,
  //           children: [
  //             Text(
  //               'Upload Profile\n photo',
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                   fontSize: 19,
  //                   fontWeight: FontWeight.w600,
  //                   color: Colors.black),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Colors.white54,
  //                     fixedSize: Size(110, 110),
  //                     elevation: 1,
  //                     shape: CircleBorder(),
  //                   ),
  //                   onPressed: () async {
  //                     var pickImage = await pickerOne.pickImage(
  //                       source: ImageSource.gallery,
  //                       maxHeight: 1080,
  //                       maxWidth: 1080,
  //                     );
  //                     if (pickImage != null) {
  //                       // Crop the selected image
  //                       CroppedFile? croppedImage =
  //                           await ImageCropper().cropImage(
  //                         sourcePath: pickImage.path,
  //                       );
  //
  //                       if (croppedImage != null) {
  //                         setState(() {
  //                           imageOne = File(croppedImage
  //                               .path); // Convert CroppedFile to File
  //                         });
  //                       }
  //                     } else {
  //                       print('No image selected');
  //                     }
  //                     Navigator.pop(context);
  //                   },
  //                   child: Image.asset(
  //                     'assets/images/gal.png',
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //                 ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Colors.white54,
  //                     fixedSize: Size(110, 110),
  //                     shape: CircleBorder(),
  //                     elevation: 1,
  //                   ),
  //                   onPressed: () async {
  //                     var pickImage = await pickerOne.pickImage(
  //                       source: ImageSource.camera,
  //                       maxHeight: 1080,
  //                       maxWidth: 1080,
  //                     );
  //                     if (pickImage != null) {
  //                       // Crop the selected image
  //                       CroppedFile? croppedImage =
  //                           await ImageCropper().cropImage(
  //                         sourcePath: pickImage.path,
  //                       );
  //
  //                       if (croppedImage != null) {
  //                         setState(() {
  //                           imageOne = File(croppedImage
  //                               .path); // Convert CroppedFile to File
  //                         });
  //                       }
  //                     } else {
  //                       print('No image selected');
  //                     }
  //                     Navigator.pop(context);
  //                   },
  //                   child: Image.asset(
  //                     'assets/images/camera.png',
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //           ],
  //         );
  //       });
  // }
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

  //sign up function
  Future<void> _signUp() async {

    if (_currentValue == 0 ||
        _currentMonthValue == 0 ||
        _currentYearValue == 0) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(
        msg:
        "Please Select DOB",
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    if (_groupValue == -1) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(
        msg:
        "Please Select Gender",
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }


    // Other sign-up data...
    String name = nameC.text.toString();
    String email = emailC.text.toString();
    String password = passwordC.text.toString();
    String address = adressC.text.toString();
    String phoneNumber = phoneC.text.toString();
    String dateofbirth =
        '${_currentValue}/${_currentMonthValue}/${_currentYearValue}';
    String gender = _groupValue == 0
        ? 'Male'
        : _groupValue == 1
            ? ' Female'
            : 'Other';
    File? image = imageOne;

    setState(() {
      isLoading = true;
    });

    try {
      // Prepare the API request
      String apiUrl = Consts.BASE_URL + '/api/register';

      // Create a new multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // // Add the image file to the request as a multipart/form-data field
      // var imageStream = http.ByteStream(image!.openRead());
      // var length = await image.length();
      // var multipartFile = http.MultipartFile(
      //   'profile_image',
      //   imageStream,
      //   length,
      //   filename: 'assets/images/1.png',
      // );
      // request.files.add(multipartFile);

      if (imageOne != null) {
        var imageStream = http.ByteStream(image!.openRead());
        var length = await image.length();
        var multipartFile = http.MultipartFile(
          'profile_image',
          imageStream,
          length,
          filename: 'assets/images/1.png',
        );
        request.files.add(multipartFile);
      } else {
        // Upload a default image from assets if no image is selected
        var defaultImage =
            await rootBundle.load('assets/images/logo_splash.png');
        var defaultMultipartFile = http.MultipartFile.fromBytes(
          'profile_image',
          defaultImage.buffer.asUint8List(),
          filename: 'assets/images/default.png',
        );
        request.files.add(defaultMultipartFile);
      }

      String formattedPhoneNumber = '$selectedCountryCode$phoneNumber';
      // print(formattedPhoneNumber);

      // Add other sign-up fields as needed
      request.fields['full_name'] = name;
      request.fields['email'] = email;
      request.fields['address'] = address;
      request.fields['phone_number'] = formattedPhoneNumber;
      request.fields['date_of_birth'] = dateofbirth;
      request.fields['gender'] = gender;
      request.fields['password'] = password;
      request.fields['c_password'] = password;

      // Send the data to the server and wait for the response
      var streamedResponse = await request.send();

      // Convert the streamed response to a regular http.Response
      var response = await http.Response.fromStream(streamedResponse);

      var data = jsonDecode(response.body.toString());

      // Handle the API response here
      print(data);
      if (response.statusCode == 200) {
        // Successful sign-up
        setState(() {
          isLoading = true;
        });

        // CustomDialogs.showSnakcbar(context, 'Successfully Signup');

        String token = data['data']['token'];
        String id = data['user']['id'].toString();
        String email = data['user']['email'];
        String nam = data['user']['full_name'];

        // Store the token in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        prefs.setString('id', id);
        prefs.setString('name', nam);
        prefs.setString('email', email);

        print(
          'The nam and the token and id is : $nam , $token, $id ,$email,',
        );

        Get.offAll(() => SetWightScreen(),
        );

        // print(response.body);
        // print('Sign-up successful!');
      } else {
        setState(() {
          isLoading = false;
        });
        // print(response.body);

        CustomDialogs.showSnakcbar(context, 'Email Already Exist');

        // Error during sign-up
        // print('Error during sign-up: ${response.body}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle any other errors
      // print('Error: $e');
      CustomDialogs.showSnakcbar(context, 'Error is $e');
    }
  }

  //raadio button
  int _groupValue = -1;
}
