import 'package:flutter/material.dart';

class studioMembershipContiner extends StatefulWidget {
  const studioMembershipContiner({super.key});

  @override
  State<studioMembershipContiner> createState() => _studioMembershipContinerState();
}

class _studioMembershipContinerState extends State<studioMembershipContiner> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;

    return Container(
      width: width / 1,
      height: 190,
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
              height: 175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Studio Membership',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Select your membership plan at fitx fitness\n studio to get a customized diet plan with\n daily personal training sessions at the studio. there are three\n types of sessions available.\n • Regular session\n • Customized session\n • One to one session',
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
                      'assets/images/membership.png'),
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
