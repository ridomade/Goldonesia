import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:goldonesia/components/bottomNavBar.dart';
import 'package:goldonesia/components/bottomNavBarInvestor.dart';
import 'package:goldonesia/screen/ListIde.dart';
import 'package:goldonesia/screen/beginningPage.dart';

import 'package:goldonesia/screen/bigPicturePage.dart';
import 'package:goldonesia/screen/edit.dart';
import 'package:goldonesia/screen/ideaOptionPage.dart';

import 'package:goldonesia/screen/homePage.dart';
import 'package:goldonesia/screen/onBoardPage.dart';
import 'package:goldonesia/screen/uploadIdea.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}
