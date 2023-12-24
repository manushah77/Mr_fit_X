import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/custom_bottom_bar.dart';
import 'package:mr_fit_x/Screens/LoginScreen/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/app_background.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset('assets/images/logo_splash.png', scale: 4),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Row(
                children: [
                  Text(
                    'TOP FEATURES',
                    style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.w600,
                        fontSize: 44,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/icons/dim.png', scale: 4),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'CALORIES COUNTER (ALL YOUR MACRO)',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'sitka',
                            color: Colors.white38),
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
              padding: const EdgeInsets.only(left: 35.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/icons/dim.png', scale: 4),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'HEALTH SUMMARY (BMI, BMR BODY FAT)',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'sitka',
                            color: Colors.white38),
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
              padding: const EdgeInsets.only(left: 35.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/icons/dim.png', scale: 4),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'TRACK PROGRESS',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'sitka',
                            color: Colors.white38),
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
              padding: const EdgeInsets.only(left: 28.0, right: 28),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){
                  Get.to(()=>CustomBottomNavigationBarScreen());

                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Center(
                    child: Text('GET STARTED',style: TextStyle(
                      fontWeight: FontWeight.w500,

                    ),),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent,),
                  child: Center(
                    child: Text('Login',style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),),
                  ),
                ),
              ),
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
