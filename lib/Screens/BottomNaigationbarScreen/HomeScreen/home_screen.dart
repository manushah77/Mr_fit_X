import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mr_fit_x/Screens/BottomNaigationbarScreen/HomeScreen/video_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import '../../../../Widegts/colors_constant.dart';
import '../../../Controller/homeScreen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final VideoPlayerController videoPlayerController =
VideoPlayerController.networkUrl(
    Uri.parse('https://dm0qx8t0i9gc9.cloudfront.net/watermarks/video/B04Gfy1teiz3sdqe6/videoblocks-two-men-running-on-a-treadmill-in-the-background-of-a-large-window-in-the-fitness-room-young-men-running-in-the-fitness-room-aerobic-workouts-in-the-gym_sb7nxkbsp__53fb21765d7a1774a1fa26a2962de369__P360.mp4'));

class _HomeScreenState extends State<HomeScreen> {
  late final ChewieController chewieController;
  var controller = Get.put(HomeScreen_Controller());
  String? token;
  String? id;


  Future<void> retrieveToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token');
      id = prefs.getString('id');
      print("this is token $token");
      print("this is id $id");
    });
  }


  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      autoInitialize: true,
    );
    setState(() {
      controller.getHomeScreenData();
    });
    retrieveToken().then((value) {
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: primaryColorPurple,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Obx(() => controller.isLoading.value == true
            ? Center(
          child: Container(
            height: 100,
            width: 100,
            child: Lottie.asset(
              'assets/loader.json',
            ),
          ),
        )
            : controller.data.isEmpty
            ? ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                    ),
                    Text('No Data Available'),
                  ],
                ),
              ],
            )
            : Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                    height: height * 0.8,
                    child:ListView.builder(itemCount: controller.data.length ,itemBuilder: (context, index) {
                      return   Padding(
                        padding:
                        const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                        child: Container(
                          width: width,
                          constraints: BoxConstraints(//minWidth:125,
                            maxWidth: 300,

                          ),
                          decoration: BoxDecoration(
                              color: primaryColorPurple,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    spreadRadius: 5,
                                    blurRadius: 5)
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 10, top: 15),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        height: height * 0.32,
                                        width: width,
                                        imageUrl:
                                        '${controller.data[index]['content']}',
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url,
                                            downloadProgress) =>
                                            Center(
                                              child:
                                              Container(
                                                height: 60,
                                                width: 60,
                                                child: Lottie.asset(
                                                  'assets/loader.json',
                                                ),
                                              ),
                                            ),
                                        errorWidget: (context,
                                            url, error) =>
                                            Image.asset(
                                              'assets/images/goal_img_1.png',
                                              height: height * 0.32,
                                              width: width,
                                              fit: BoxFit.cover,
                                            ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 180,
                                      left: 200,
                                      child: Container(
                                        height: 25,
                                        width: 95,
                                        decoration: BoxDecoration(
                                          color: Color(0xff131429),
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${controller.data[index]['created_at']}'.substring(0,10),
                                            style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, left: 15),
                                child: Text(
                                  '${controller.data[index]['description']}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },)
                ),
              ],
            ),
          ],
        )),


      ),
    );
  }
}
