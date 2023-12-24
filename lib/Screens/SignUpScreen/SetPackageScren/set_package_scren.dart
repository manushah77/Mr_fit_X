import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/DateJoinScreen/date_join_screen.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../Widegts/colors_constant.dart';
import '../../../Widegts/custom_button.dart';

class SetPackageScreen extends StatefulWidget {
  double weight;
  double height;

   SetPackageScreen({required this.weight,required this.height});

  @override
  State<SetPackageScreen> createState() => _SetPackageScreenState();
}

class _SetPackageScreenState extends State<SetPackageScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('asdasd ${widget.weight}');
    print('jhgjh ${widget.height}');
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      extendBody: true,
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
                '3 of 6 Steps',
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
                padding: const EdgeInsets.only(left: 28.0),
                child: Row(
                  children: [
                    Text(
                      'Select Package',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25),
                child: Container(
                  height: 360,
                  width: width/1,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/box.png'),),

                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/crown.png',scale: 1.5,),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Guest Mood',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.white70),
                            ),
                           ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 45.0,right: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Free /',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white70),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                'Track your fitness progress\n and health goals',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white70),
                                textScaleFactor: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 45.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/icons/check.png',scale: 2,),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'BMR , BMI , BODY FAT %',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white54),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 45.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/icons/check.png',scale: 2,),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'CALORIES COUNTER',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white54),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 45.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/icons/check.png',scale: 2,),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'PROGRESS TRACKER',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white54),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 12.0,right: 12,top: 15),
                        child: SizedBox(
                          height: 50,
                          width: width/1.5,
                          child: CustomButton(
                            title: 'Select Plan',
                            onTap: (){
                              Get.to(()=>DateJoinScreen(weight: widget.weight, height: widget.height,));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
