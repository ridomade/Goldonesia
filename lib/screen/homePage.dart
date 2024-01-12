import 'package:flutter/material.dart';
import 'package:goldonesia/components/bottomNavBar.dart';
import 'package:goldonesia/screen/uploadIdea.dart';

import '../components/gradientButton.dart';
import '../constants/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [lightGreen, lightGreen, white, white, white, white, teal],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, border: Border.all(width: 1)),
                child: const Icon(
                  Icons.person,
                  size: 55,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: Container(
                child: Icon(
                  Icons.notifications_none,
                  size: 48,
                  color: blue,
                ),
              ),
            ),
          ],
          title: const Padding(
            padding: EdgeInsets.only(left: 36.0),
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
                Text(
                  "Username",
                  style: TextStyle(
                    fontFamily: 'Odudo-Soft',
                    color: Color(0xFF0766AD),
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Ayo wujudkan masa depan\nyang lebih baik!",
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
                      height: 100,
                    ),
                    GradientButton(
                      text: "Siapkan Ide Bisnismu Disini",
                      gradientColors: [teal, slightGrey],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => uploadIdea()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    GradientButton(
                      text: "Test",
                      gradientColors: [teal, slightGrey],
                    ),
                    SizedBox(
                      height: 50,
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
