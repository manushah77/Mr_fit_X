import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/ProfileScreen/ShopScreen/shop_screen.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/SetPackageScren/set_package_scren.dart';
import 'package:mr_fit_x/Widegts/colors_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widegts/dialoag_widget.dart';
import '../LoginScreen/login_screen.dart';
import 'ProfileScreen/SetPlanScreen/set_plan_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Drawer(
        backgroundColor: primaryColorPurple,
        elevation: 0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            Container(
              height: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/gym_post.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.6,
                ),
              ),
              child: DrawerHeader(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back),color: Colors.white,),
                      ],
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/gym_post.jpg'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Mansoor Ali",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "ali977@gmail.com",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // plan
            buildDrawerItem(
              onTap: () {
                Get.to(() => SetPlanScreen());
              },
              iconPath: 'assets/icons/plan.png',
              label: "Plans",
            ),
            SizedBox(height: 10),

            // shops
            buildDrawerItem(
              onTap: () {
                Get.to(() => ShopScreen());
              },
              iconPath: 'assets/icons/shop.png',
              label: "Shops",
            ),
            SizedBox(height: 10),

            // edit profile
            buildDrawerItem(
              iconPath: 'assets/icons/person.png',
              label: "Edit Profile Detail",
            ),
            SizedBox(height: 180),

            // fit x image
            Center(
              child: Image.asset(
                'assets/images/fit_x.png',
                scale: 3.5,
              ),
            ),
            SizedBox(height: 10),

            // logout
            buildDrawerItem(
              onTap: () async{
                SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.setString('token', '');
                // prefs.setString('id', '');

                CustomDialogs.showSnakcbar(context, 'Successfully Logout');

                Get.offAll(LoginScreen());

              },
              iconPath: 'assets/icons/logOut.png',
              label: "Logout",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItem(
      {required String iconPath, required String label, Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/draw.png'),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // Center the content
                children: [
                  Image.asset(
                    iconPath,
                    scale: 3,
                  ),
                  SizedBox(width: 10),
                  Text(
                    label,
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    User? user = FirebaseAuth.instance.currentUser;
  }
}
