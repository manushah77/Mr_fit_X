import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_fit_x/Screens/SignUpScreen/GoalOfJoiningScreen/goal_of_join_screen.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../Widegts/colors_constant.dart';
import '../../../Widegts/custom_button.dart';

class DateJoinScreen extends StatefulWidget {
  double weight;
  double height;

   DateJoinScreen({required this.weight, required this.height});

  @override
  State<DateJoinScreen> createState() => _DateJoinScreenState();
}

class _DateJoinScreenState extends State<DateJoinScreen> {

  List<dynamic> tags = [];
  String? selectedChipTitle;
  DateTime selectedDate = DateTime.now();
  DateTime? picked;



  Future<void> _selectDate(BuildContext context) async {
    picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 20),
        builder: (BuildContext context, Widget ?child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.grey,
              splashColor: Colors.black,
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: primaryColor, // button text color
                ),
              ),
              colorScheme: ColorScheme.light(
                  primary: Colors.grey,
                  onSecondary: Colors.black,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.white,
                  secondary: Colors.white),
              dialogBackgroundColor: Colors.black,
            ),
            child: child ??Text(""),

          );
        }
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked!;
      });
    }
  }

  // double convertINtoCM(double inch) => inch * 2.54;
  double convertFTtoCM(double foot) => foot * 30.48;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('asdasd ${widget.weight}');
    print('jhgjh ${widget.height}');
    print('convert ${convertFTtoCM(widget.height)}');


  }



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    List<String> chipTitles = ['06:00 PM TO 7:00 PM', '07:00 PM TO 8:00 PM','08:00 PM TO 9:00 PM','09:00 PM TO 10:00 PM','09:30 AM TO 10:30 AM'];

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
                '4 of 6 Steps',
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
                      'Date To Join Gym?',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28),
                child: InkWell(
                  onTap: (){
                    _selectDate(context);
                  },
                  child: Container(
                    width: width / 1,
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          picked == null
                              ? 'Select joining Date'
                              : '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Row(
                  children: [
                    Text(
                      'Timings Of Male Gym',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
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
                      '(Morning/Evening)',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.white54),
                    ),
                  ],
                ),
              ),
          Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 22),
            child: Wrap(
              runAlignment: WrapAlignment.start,
              children: chipTitles.map((title) {
                return PickChip(
                  title: title,
                  allTitles: chipTitles,
                  onChipSelected: (selectedTitle) {
                    setState(() {
                      selectedChipTitle = selectedTitle;
                    });
                  },
                  selectedTitle: selectedChipTitle,
                );
              }).toList(),
            ),
          ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15),
                child: CustomButton(
                  title: 'Next',
                  onTap: (){
                    Get.to(()=>GolOfJoinningScreen(weight: widget.weight, height: convertFTtoCM(widget.height), gymTime: selectedChipTitle.toString(), jointData: selectedDate.millisecondsSinceEpoch.toString(),));

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PickChip extends StatefulWidget {
  String? title;
  List<String>? allTitles; // Add a list to keep track of all chip titles
  ValueChanged<String>? onChipSelected; // Callback for chip selection
  String? selectedTitle; // The currently selected chip title

  PickChip({Key? key, this.title, this.allTitles, this.onChipSelected, this.selectedTitle}) : super(key: key);

  @override
  State<PickChip> createState() => _PickChipState();
}

class _PickChipState extends State<PickChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, top: 4),
      child: Theme(
        data: ThemeData(canvasColor: Colors.transparent),
        child: ChoiceChip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.white)
          ),
          label: Text(
            '${widget.title}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: widget.selectedTitle == widget.title ? Colors.black : Colors.white,
            ),
          ),
          elevation: 0,
          selected: widget.selectedTitle == widget.title,
          onSelected: (isSelected) {
            if (isSelected) {
              // Notify the parent widget about the selected chip
              widget.onChipSelected?.call(widget.title!);
            }
          },
          selectedColor: widget.selectedTitle == widget.title ? Colors.white : Colors.transparent,
        ),
      ),
    );
  }
}

