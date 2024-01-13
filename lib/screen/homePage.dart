import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goldonesia/components/bottomNavBar.dart';
import 'package:goldonesia/database/getUserData.dart';
import 'package:goldonesia/screen/uploadIdea.dart';

import '../components/gradientButton.dart';
import '../constants/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "loading...";
  @override
  void initState() {
    super.initState();
    getUser();
  }

  final db = FirebaseFirestore.instance;
  void getUser() {
    final docRef =
        db.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid);
    docRef.snapshots().listen(
      (event) {
        setState(() {
          username = event['username'];
        });
      },
      onError: (error) => print("Listen failed: $error"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            lightGreen,
            lightGreen,
            white,
            white,
            white,
            white,
            white,
            teal,
            teal
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 28.0),
        //       child: Container(
        //         decoration: BoxDecoration(
        //             shape: BoxShape.circle, border: Border.all(width: 1)),
        //         child: const Icon(
        //           Icons.person,
        //           size: 55,
        //         ),
        //       ),
        //     ),
        //     SizedBox(height: 20),
        //     Padding(
        //       padding: const EdgeInsets.only(right: 28.0),
        //       child: Container(
        //         child: Icon(
        //           Icons.notifications_none,
        //           size: 48,
        //           color: blue,
        //         ),
        //       ),
        //     ),
        //   ],
        //   title: Padding(
        //     padding: EdgeInsets.only(left: 36.0),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const Text(
        //           "Halo,",
        //           style: TextStyle(
        //             fontFamily: 'Odudo-Soft',
        //             color: Color(0xFF0766AD),
        //             fontSize: 22,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //         Text(
        //           username,
        //           style: const TextStyle(
        //             fontFamily: 'Odudo-Soft',
        //             color: Color(0xFF0766AD),
        //             fontSize: 32,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //         const Text(
        //           "Ayo wujudkan masa depan\nyang lebih baik!",
        //           style: TextStyle(
        //             fontFamily: 'Odudo-Soft',
        //             color: Color(0xFF0766AD),
        //             fontSize: 18,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   toolbarHeight: 150,
        // ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(
                Icons.person,
                size: 48,
                color: blue,
              ), // Replace with your second icon
              onPressed: () {
                // Handle the press for the second icon
              },
            ),
            SizedBox(width: 50),
          ],
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Halo,",
                      style: TextStyle(
                        fontFamily: 'Odudo-Soft',
                        color: Color(0xFF0766AD),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      username,
                      style: TextStyle(
                        fontFamily: 'Odudo-Soft',
                        color: Color(0xFF0766AD),
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Ayo wujudkan masa depan",
                      style: TextStyle(
                        fontFamily: 'Odudo-Soft',
                        color: Color(0xFF0766AD),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "yang lebih baik!",
                      style: TextStyle(
                        fontFamily: 'Odudo-Soft',
                        color: Color(0xFF0766AD),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          toolbarHeight: 150,
        ),

        body: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: 290, // atur lebar sesuai kebutuhan
                      height: 90, // atur tinggi sesuai kebutuhan
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [teal, teal, white],
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => uploadIdea()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Remove padding
                          alignment: Alignment
                              .centerLeft, // Align the text to the left
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              const Text(
                                'Siapkan Ide\nBisnismu Disini',
                                style: TextStyle(
                                  fontFamily: 'Odudo-Soft',
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              // Add some space between text and image
                              Image.asset(
                                'assets/bisnis.png', // Replace with the actual image path
                                height: 150, // Set the height of the image
                                // Set the height of the image
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // GradientButton(
                    //   text: "Siapkan Ide Bisnismu Disini",
                    //   gradientColors: [teal, teal, teal, slightGrey],
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => uploadIdea()),
                    //     );
                    //   },
                    // ),
                    SizedBox(
                      height: 19,
                    ),
                    Container(
                      width: 290, // atur lebar sesuai kebutuhan
                      height: 90, // atur tinggi sesuai kebutuhan
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromARGB(255, 213, 241, 194),
                            lightGreen,
                            lightGreen
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => uploadIdea()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Remove padding
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: Image.asset(
                                'assets/sampah.png', // Replace with the actual image path
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Container(
                                width:
                                    145, // Set the width of the text container
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                  ),
                                  color: Colors.transparent,
                                ),
                                child: Text(
                                  'Kelola Sampahmu\nMulai Sekarang',
                                  style: TextStyle(
                                    fontFamily: 'Odudo-Soft',
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigation(),
          ),
        ),
      ),
    );
  }
}
