import 'package:flutter/material.dart';
import 'package:mr_fit_x/Widegts/colors_constant.dart';

class CustomButton extends StatelessWidget {
  String? title;
  Function? onTap;
   CustomButton({this.onTap,this.title});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18),
      child: InkWell(
        onTap: () {
          onTap!();
        },
        child: Container(
          height: 56,
          width: width / 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              primaryColor,
              Color(0xffC82F81)
            ]),
            borderRadius: BorderRadius.circular(30)
          ), 
          child: Center(
            child: Text(
              title.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        ),
      ),
    );
  }
}
