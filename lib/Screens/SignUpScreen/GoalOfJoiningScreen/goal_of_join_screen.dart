import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/DateJoinScreen/date_join_screen.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/GainWeightScreen/gain_weight_screen.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../Widegts/colors_constant.dart';
import '../../../Widegts/custom_button.dart';

class GolOfJoinningScreen extends StatefulWidget {
  double weight;
  double height;
  String jointData;
  String gymTime;

   GolOfJoinningScreen({required this.weight, required this.height,required this.gymTime,required this.jointData,});

  @override
  State<GolOfJoinningScreen> createState() => _GolOfJoinningScreenState();
}

class _GolOfJoinningScreenState extends State<GolOfJoinningScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('asdasd ${widget.weight}');
    print('jhgjh ${widget.height}');
    print('asdasd ${widget.gymTime}');
    print('jhgjh ${widget.jointData}');
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
                '5 of 6 Steps',
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
          child: SingleChildScrollView(
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
                        'Goal of Joining Gym?',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25),
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>GetWightScreen(height: widget.height, weight: widget.weight, jointData: '${widget.jointData}', gymTime: '${widget.gymTime}', goal: 'FITNESS',));
                    },
                    child: SelectedContainer(img: 'assets/images/goal_img_1.png', txt: 'FITNESS'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25),
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>GetWightScreen(height: widget.height, weight: widget.weight, jointData: '${widget.jointData}', gymTime: '${widget.gymTime}', goal: 'FAT LOSS',));

                    },
                    child: SelectedContainer(img: 'assets/images/goal_img_4.png', txt: 'FAT LOSS'),

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25),
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>GetWightScreen(height: widget.height, weight: widget.weight, jointData: '${widget.jointData}', gymTime: '${widget.gymTime}', goal: 'STRENGHT',));

                    },
                    child: SelectedContainer(img: 'assets/images/goal_img_5.png', txt: 'STRENGHT'),

                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedContainer extends StatelessWidget {
  String img;
  String txt;
  SelectedContainer({required this.img,required this.txt});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return  Container(
      height: 180,
      width: width / 1,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover
        ),
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(color: Colors.white, fontSize: 32,fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}


