import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/CaloriesScreen/calories_screen.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/HomeScreen/home_screen.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/ProfileScreen/profile_screen.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/custom_drawer.dart';
import 'package:mr_fit_x/Widegts/colors_constant.dart';

class CustomBottomNavigationBarScreen extends StatefulWidget {
  @override
  _CustomBottomNavigationBarScreenState createState() =>
      _CustomBottomNavigationBarScreenState();
}

class _CustomBottomNavigationBarScreenState
    extends State<CustomBottomNavigationBarScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        systemOverlayStyle:
        SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: primaryColorPurple,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12, top: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Image.asset(
                  'assets/images/fit_x.png',
                  scale: 2.7,
                ),
              ),
              Builder(
                builder: (context) => IconButton(
                  icon: Image.asset(
                    'assets/icons/drawer.png',
                    height: 50,
                    width: 50,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),

            ],
          ),

        ),
      ),
      drawer: MyDrawer(),


      extendBody: true,
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          CaloriesScreen(),
          HomeScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20, left: 22, right: 22),
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xff000000),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        padding: EdgeInsets.all(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildNavItem(0, 'assets/icons/burger.png', 'Calories',24 , 22),
            buildNavItem(1, 'assets/icons/home.png', 'Home',24 , 22),
            buildNavItem(2, 'assets/icons/person.png', 'Profile',27 , 24,),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(int index, String imagePath, String label,double select , double unselect) {
    bool isSelected = index == currentIndex;
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              color: isSelected ? Colors.white : Colors.white70,
              height: isSelected ? select : unselect,
            ),
            SizedBox(height: 4),
            isSelected ?
            AnimatedDefaultTextStyle(
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize:10,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Text(label),
            ) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
