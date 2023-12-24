import 'package:flutter/material.dart';
import 'package:mr_fit_x/Widegts/colors_constant.dart';

class BmrWidget extends StatefulWidget {
  Function ontap;

   BmrWidget({required this.ontap});

  @override
  State<BmrWidget> createState() => _BmrWidgetState();
}

class _BmrWidgetState extends State<BmrWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;

    return  Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Container(
        width: width / 1,
        height: 260,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage('assets/images/line.png'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Column(
            children: [
              Container(
                height: 100,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'BMR',
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
                          'The basal metabolic rate (BMR) calculator estimates your\n basal metabolic rate-the amount of energy expended\n while at rest in a neutrally temperate environment, and in a\n post-absorptive state.',
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
              Padding(
                padding:
                const EdgeInsets.only(left: 10.0, right: 10),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 155,
                      height: 150,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                '10.4 ',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: primaryColorYellow,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Calosries/Day',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: (){
                              widget.ontap();
                            },
                            child: Container(
                              width: 180,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Color(0xf746984),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                borderRadius:
                                BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 40,
                                        child: Stack(
                                          children: [
                                            Text(
                                              '22',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.w300,
                                              ),
                                            ),
                                            Positioned(
                                              top: 12,
                                              left: 20,
                                              child: Text(
                                                'Yrs',
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  color:
                                                  Colors.white,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Age',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white30,
                                          fontWeight:
                                          FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 25,
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 40,
                                        child: Stack(
                                          children: [
                                            Text(
                                              '166',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.w300,
                                              ),
                                            ),
                                            Positioned(
                                              top: 12,
                                              left: 22,
                                              child: Text(
                                                'Cm',
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  color:
                                                  Colors.white,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Height',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white30,
                                          fontWeight:
                                          FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 25,
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 40,
                                        child: Stack(
                                          children: [
                                            Text(
                                              '55',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.w300,
                                              ),
                                            ),
                                            Positioned(
                                              top: 12,
                                              left: 20,
                                              child: Text(
                                                'kg',
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  color:
                                                  Colors.white,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Weight',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white30,
                                          fontWeight:
                                          FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Container(
                          //   width: 180,
                          //   height: 57,
                          //   decoration: BoxDecoration(
                          //     color: Color(0xf746984),
                          //     border: Border.all(
                          //       color: Colors.white,
                          //       width: 2,
                          //     ),
                          //     borderRadius:
                          //         BorderRadius.circular(10),
                          //   ),
                          //   child: Row(
                          //     mainAxisAlignment:
                          //         MainAxisAlignment.spaceEvenly,
                          //     children: [
                          //       Column(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.center,
                          //         children: [
                          //           Container(
                          //             height: 25,
                          //             width: 40,
                          //             child: Stack(
                          //               children: [
                          //                 Text(
                          //                   '22',
                          //                   style: TextStyle(
                          //                     fontSize: 16,
                          //                     color: Colors.white,
                          //                     fontWeight:
                          //                         FontWeight.w300,
                          //                   ),
                          //                 ),
                          //                 Positioned(
                          //                   top: 12,
                          //                   left: 23,
                          //                   child: Text(
                          //                     'Yrs',
                          //                     style: TextStyle(
                          //                       fontSize: 10,
                          //                       color:
                          //                           Colors.white,
                          //                       fontWeight:
                          //                           FontWeight
                          //                               .w400,
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //           Text(
                          //             'Age',
                          //             style: TextStyle(
                          //               fontSize: 12,
                          //               color: Colors.white30,
                          //               fontWeight:
                          //                   FontWeight.w400,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       Container(
                          //         height: 25,
                          //         width: 1,
                          //         color: Colors.white,
                          //       ),
                          //       Column(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.center,
                          //         children: [
                          //           Container(
                          //             height: 25,
                          //             width: 40,
                          //             child: Stack(
                          //               children: [
                          //                 Text(
                          //                   '166',
                          //                   style: TextStyle(
                          //                     fontSize: 16,
                          //                     color: Colors.white,
                          //                     fontWeight:
                          //                         FontWeight.w300,
                          //                   ),
                          //                 ),
                          //                 Positioned(
                          //                   top: 12,
                          //                   left: 23,
                          //                   child: Text(
                          //                     'Cm',
                          //                     style: TextStyle(
                          //                       fontSize: 10,
                          //                       color:
                          //                           Colors.white,
                          //                       fontWeight:
                          //                           FontWeight
                          //                               .w400,
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //           Text(
                          //             'Height',
                          //             style: TextStyle(
                          //               fontSize: 12,
                          //               color: Colors.white30,
                          //               fontWeight:
                          //                   FontWeight.w400,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       Container(
                          //         height: 25,
                          //         width: 1,
                          //         color: Colors.white,
                          //       ),
                          //       Column(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.center,
                          //         children: [
                          //           Container(
                          //             height: 25,
                          //             width: 40,
                          //             child: Stack(
                          //               children: [
                          //                 Text(
                          //                   '55',
                          //                   style: TextStyle(
                          //                     fontSize: 16,
                          //                     color: Colors.white,
                          //                     fontWeight:
                          //                         FontWeight.w300,
                          //                   ),
                          //                 ),
                          //                 Positioned(
                          //                   top: 12,
                          //                   left: 23,
                          //                   child: Text(
                          //                     'kg',
                          //                     style: TextStyle(
                          //                       fontSize: 10,
                          //                       color:
                          //                           Colors.white,
                          //                       fontWeight:
                          //                           FontWeight
                          //                               .w400,
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //           Text(
                          //             'Weight',
                          //             style: TextStyle(
                          //               fontSize: 12,
                          //               color: Colors.white30,
                          //               fontWeight:
                          //                   FontWeight.w400,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 100,
                            height: 27,
                            decoration: BoxDecoration(
                              color: Color(0xffc6811d),
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Check',
                                style: TextStyle(
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage('assets/images/bmr.png'),
                            fit: BoxFit.cover,
                          )),
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
