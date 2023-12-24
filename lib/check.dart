import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Screen10 extends StatefulWidget {
  const Screen10({super.key});

  @override
  State<Screen10> createState() => _Screen10State();
}

class _Screen10State extends State<Screen10> {
  @override
  Widget build(BuildContext context) {
    File? imageOne;
    final pickerOne = ImagePicker();

    // bool isUploaded = false;

    void _showBottomSheetTwo() {
      showModalBottomSheet(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (_) {
            return ListView(
              padding: EdgeInsets.only(top: 15),
              shrinkWrap: true,
              children: [
                Text(
                  'Upload Company\'s\n Logo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(110, 110),
                        elevation: 1,
                        shape: CircleBorder(),
                      ),
                      onPressed: () async {
                        var pickImage = await pickerOne.pickImage(
                            source: ImageSource.gallery);

                        setState(() {
                          if (pickImage != null) {
                            imageOne = File(pickImage.path);
                            print(imageOne);
                          } else {
                            print('no image selected');
                          }
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/images/gal.png'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(110, 110),
                        shape: CircleBorder(),
                        elevation: 1,
                      ),
                      onPressed: () async {
                        var pickImage = await pickerOne.pickImage(
                            source: ImageSource.camera);

                        setState(() {
                          if (pickImage != null) {
                            imageOne = File(pickImage.path);
                          } else {
                            print('no image selected');
                          }
                        });
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/camera.png',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          });
    }

    final h = MediaQuery.of(context).size.height * (1 / 760);
    final w = MediaQuery.of(context).size.width * (1 / 360);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Request \nVerification',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffFBAA1A),
                    fontFamily: 'JT',
                    fontSize: w * 30,
                  ),
                ),
                InkWell(
                  onTap: () {
                  },
                  child:  Container(
                          width: w * 296.45,
                          height: w * 139.45,
                          decoration: BoxDecoration(
                            color: const Color(0xffF6F7FC),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(width: 6, color: Colors.white),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: w * 29,
                                ),
                                Icon(
                                  Icons.camera_alt,
                                  size: w * 63,
                                  color: Colors.black.withOpacity(.16),
                                ),
                                Text(
                                  'Selfie',
                                  style: TextStyle(
                                    color: Color(0xff1F1F24),
                                    fontSize: w * 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 14,
                ),
                InkWell(
                  onTap: () {
                    _showBottomSheetTwo();
                  },
                  child:
                  imageOne != null
                      ? ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(20)),
                    child: Image.file(
                      imageOne!,
                      fit: BoxFit.cover,
                      width: 300,
                      height:200,
                    ),
                  )
                      :
                  Container(
                    width: 300,
                    height:200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 6, color: Colors.white),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: w * 29,
                          ),
                          Icon(
                            Icons.add_circle,
                            size: w * 63,
                            color: Colors.black.withOpacity(.16),
                          ),
                          Text(
                            'ID Card Front Side',
                            style: TextStyle(
                                color: Color(0xff1F1F24),
                                fontSize: w * 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  width: w * 296.45,
                  height: w * 139.45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(width: 6, color: Colors.white),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: w * 29,
                        ),
                        Icon(
                          Icons.add_circle,
                          size: w * 63,
                          color: Colors.black.withOpacity(.16),
                        ),
                        const Text(
                          'ID Card Back Side',
                          style: TextStyle(
                              color: Color(0xff1F1F24),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 56,
                    width: w * 268,
                    decoration: BoxDecoration(
                      color: const Color(0xff98C7DB),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Request',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
