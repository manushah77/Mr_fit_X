import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'colors_constant.dart';

class GlassWidget extends StatefulWidget {
  const GlassWidget({super.key});

  @override
  State<GlassWidget> createState() => _GlassWidgetState();
}

class _GlassWidgetState extends State<GlassWidget> {
  int selectedGlassIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;

    return  Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Container(
        width: width / 1,
        height: 150,
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
              Container(
                height: 150,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Water Glass',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Water is good!',
                          style: TextStyle(
                            color: primaryColorYellow,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Have your next glass of \nwater after 60 minutes',
                          style: TextStyle(
                            color: Colors.white24,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                width: 150,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (selectedGlassIndex <= 0) {
                            selectedGlassIndex = 0;
                          } else {
                            setState(() {
                              selectedGlassIndex--;
                            });
                          }
                        });
                      },
                      child: Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                            const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.maximize,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        CircularPercentIndicator(
                          radius: 40,
                          percent: selectedGlassIndex / 7,
                          // animation: true,
                          lineWidth: 6,
                          // animationDuration: 1500,
                          center: Image.asset(
                            'assets/images/glass.png',
                            scale: 1.2,
                          ),
                          progressColor: primaryColorYellow,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          '${selectedGlassIndex} of 7',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          'Glass',
                          style: TextStyle(
                              color: Colors.white24,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (selectedGlassIndex < 7) {
                            selectedGlassIndex =
                                (selectedGlassIndex + 1) % 8;
                          } else {
                            // Display toast message when the limit is reached
                            Fluttertoast.showToast(
                              msg:
                              "You have reached your goal",
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          }
                        });
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Color(0xffc6811d),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
