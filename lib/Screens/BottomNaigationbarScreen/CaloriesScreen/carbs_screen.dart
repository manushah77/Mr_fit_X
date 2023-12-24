import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mr_fit_x/Widegts/custom_text_field.dart';

import '../../../Widegts/colors_constant.dart';
import '../../../Widegts/custom_button.dart';

class CarbsAddScreen extends StatefulWidget {
  const CarbsAddScreen({super.key});

  @override
  State<CarbsAddScreen> createState() => _CarbsAddScreenState();
}

class _CarbsAddScreenState extends State<CarbsAddScreen> {
  String? dropdownValueThree;
  bool hasMadeSelectionTwo = false;
  int value = 0;



  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: primaryColorPurple,
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0,left: 50,right: 50),
        child: CustomButton(
          title: 'Save',
          onTap: () {
          },
        ),
      ),
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
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
           Stack(
             children: [
               Container(
                 height: 270,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('assets/images/food_img.png'),
                     fit: BoxFit.cover,
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(right: 18.0, left: 18,top: 205),
                 child: SizedBox(
                   width: width/1,
                   height: 80,
                   child: TextFormField(
                     cursorColor: Colors.white,
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontFamily: 'Inter',
                       fontWeight: FontWeight.w500,
                     ),
                     // controller: controller.email,
                     keyboardType: TextInputType.emailAddress,

                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.only(
                         top: 10,
                         left: 15,
                         right: 13,
                         bottom: 10,
                       ),
                       border: InputBorder.none,
                       hintText: 'Search Meal',
                       hintStyle: TextStyle(
                         color:Colors.white,
                         fontSize: 14,
                         fontFamily: 'Inter',
                         fontWeight: FontWeight.w300,
                       ),
                       focusedErrorBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(5),
                         borderSide: BorderSide(
                           color: Colors.white,
                         ),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(5),
                         borderSide: BorderSide(
                           color: Colors.white,
                         ),
                       ),
                       errorBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(5),
                         borderSide: BorderSide(
                           color: Colors.white,
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(5),
                         borderSide: BorderSide(
                           color: Colors.white,
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Row(
                  children: [
                    Text(
                      'Quantity in',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28),
                child: Container(
                  width: width/1,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff1f2034).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text('Quantity',style: TextStyle(color: Colors.white54),),
                      items: <String>[
                        'Katori',
                        'Baol',
                      ]
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ))
                          .toList(),
                      value: hasMadeSelectionTwo ? dropdownValueThree : null,
                      onChanged: (value) {
                        setState(() {
                          dropdownValueThree = value as String;
                          hasMadeSelectionTwo=true;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        width: 160,
                        padding: const EdgeInsets.only(left: 18, right: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                        ),
                      ),
                      iconStyleData: IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                        ),
                        iconSize: 28,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        padding: null,
                        direction: DropdownDirection.left,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Row(
                  children: [
                    Text(
                      'Enter the quantity',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28),
                child: Container(
                  width: width / 1,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage('assets/images/line.png'),fit: BoxFit.cover)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            if(value <= 0) {
                              value = 0;
                            }
                            else {
                              setState(() {
                                value--;
                              });
                            }

                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Color(0xffc6811d),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Text('-',style: TextStyle(color: Colors.white,fontSize: 26),),),
                          ),
                        ),
                        Text(value.toString(),style: TextStyle(color: Colors.white54,fontSize: 17,fontWeight: FontWeight.w300),),
                        InkWell(
                          onTap: (){
                            setState(() {
                              value++;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Color(0xffc6811d),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Text('+',style: TextStyle(color: Colors.white,fontSize: 18),),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Row(
                  children: [
                    Text(
                      'Nutritional Information',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0,right: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/fiber.png',scale: 5.2,),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1.04',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            'Fiber',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15, color: Colors.white54),
                          ),
                        ],
                      )
                    ],
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/bread.png',scale: 3.6,),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2.60',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              'Carbs',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15, color: Colors.white54),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/protine.png',scale: 2.6,),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '14.04',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              'Protein',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15, color: Colors.white54),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0,right: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/fats_img.png',scale: 2.5,),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1.04',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            'Fats',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15, color: Colors.white54),
                          ),
                        ],
                      )
                    ],
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/calories.png',scale: 2.5,),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '174.04',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              'Calories',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15, color: Colors.white54),
                            ),
                          ],
                        )
                      ],
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
