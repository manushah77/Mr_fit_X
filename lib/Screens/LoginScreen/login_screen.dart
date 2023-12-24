import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/custom_bottom_bar.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/signup_screen.dart';
import 'package:mr_fit_x/Widegts/custom_button.dart';

import '../../Controller/login_controller.dart';
import '../../Widegts/custom_text_field.dart';
import '../ForgetPasswordScren/forget_passwrod_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool ispasswordvisible = true;
  var controller = Get.put(login_Controller());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/auth_back_img.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an accont.',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.white70),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: controller.logInformKey.value,
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Row(
                        children: [
                          Text(
                            'Login',
                            style: GoogleFonts.robotoCondensed(
                                fontWeight: FontWeight.w600,
                                fontSize: 44,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Row(
                        children: [
                          Text(
                            'Train and live the new experience of\nexcercising at home',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                        ],
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
                          hintText: 'Enter Email',
                          errorHint: 'Enter email',
                          keyboradType: TextInputType.emailAddress,
                          validate: true,
                          controller: controller.email,
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
                          hintText: 'Enter Password',
                          validate: true,
                          errorHint: 'Enter Password',
                          controller: controller.pass,
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

                    //forget password
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => ForgetPasswordScreeen());
                            },
                            child: Text(
                              'Forget your password ?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.white38,),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //button

                    SizedBox(
                      height: 30,
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
                          : CustomButton(
                              title: 'Login',
                              onTap: () {
                                if (controller.logInformKey.value.currentState!
                                    .validate()) {
                                  controller.loginUser(
                                    controller.email.value.text,
                                    controller.pass.value.text,
                                    context,
                                  );
                                }
                              },
                            ),
                    ),

                    //for  sign up

                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
