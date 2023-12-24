import 'package:flutter/material.dart';

class DietPlanContainer extends StatefulWidget {
  const DietPlanContainer({super.key});

  @override
  State<DietPlanContainer> createState() => _DietPlanContainerState();
}

class _DietPlanContainerState extends State<DietPlanContainer> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;

    return Container(
      width: width / 1,
      height: 165,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage('assets/images/line.png'),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width / 2,
              height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Diet Plan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'A healthy eating plan gives your body the\n nutrients it needs every day while staying\n within your daily calorie goal for weight\n loss. a healthy eating plan also will lower\n your risk for heart disease and other\n health conditions.',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width / 3,
              height: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/diet_img.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
