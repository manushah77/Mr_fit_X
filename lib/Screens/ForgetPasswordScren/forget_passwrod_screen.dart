import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:mr_fit_x/Controller/login_controller.dart';
import 'package:mr_fit_x/Widegts/colors_constant.dart';
import '../../Widegts/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPasswordScreeen extends StatefulWidget {
  const ForgetPasswordScreeen({super.key});

  @override
  State<ForgetPasswordScreeen> createState() => _ForgetPasswordScreeenState();
}

class _ForgetPasswordScreeenState extends State<ForgetPasswordScreeen> {
  var controller = Get.put(login_Controller());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: primaryColorPurple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Forget Password',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Form(
            key: controller.passwordReset.value,
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                ),
                Image.asset(
                  'assets/images/forget.png',
                  scale: 3,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Forgot your password?',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Please enter the Email associated\n with your account. We\'ll mail you a \nlink to reset your password.',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.white38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 210,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22.0),
                      child: Text(
                        'Email',
                        style: GoogleFonts.lato(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 18.0, left: 18, top: 10),
                  child: SizedBox(
                    width: width / 1,
                    height: 80,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.only(
                          top: 10,
                          left: 15,
                          right: 13,
                          bottom: 10,
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300,
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => controller.isLoading.value == true
                      ? Center(
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Lottie.asset(
                              'assets/loader.json',
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 50,
                          width: 220,
                          child: CustomButton(
                            title: 'Send',
                            onTap: () {
                              if (controller.passwordReset.value.currentState!
                                  .validate()) {
                                controller.ressetPass(
                                    controller.email.value.text, context);
                              }
                            },
                          ),
                        ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
