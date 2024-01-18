import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goldonesia/screen/ListIde.dart';
import 'package:goldonesia/screen/ideaOptionPage.dart';
import '../constants/color.dart';

class HomePageInvestor extends StatefulWidget {
  const HomePageInvestor({super.key});

  @override
  State<HomePageInvestor> createState() => _HomePageInvestorState();
}

class _HomePageInvestorState extends State<HomePageInvestor> {
  String username = "loading...";
  String userProfile =
      'https://firebasestorage.googleapis.com/v0/b/goldonesia-database.appspot.com/o/Users%2Fdefault_profile_photo.jpg?alt=media&token=d5f13064-c8a5-4fdb-a040-1735dab03d5e';
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
          userProfile = event['profileURL'];
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap: () {
                print("Masuk Ke laman Profile");
              },
              child: CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                    child: Image.network(
                      userProfile,
                    ),
                  ),
                  backgroundColor: Colors.transparent),
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
                    const Text(
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
                      style: const TextStyle(
                        fontFamily: 'Odudo-Soft',
                        color: Color(0xFF0766AD),
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    const Text(
                      "Ayo wujudkan masa depan",
                      style: TextStyle(
                        fontFamily: 'Odudo-Soft',
                        color: Color(0xFF0766AD),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
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
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: 330, // atur lebar sesuai kebutuhan
                      height: 105, // atur tinggi sesuai kebutuhan
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            teal,
                            teal,
                            Color.fromARGB(255, 197, 236, 230)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListIde()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Remove padding
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 6,
                              bottom: 0,
                              child: Image.asset(
                                'assets/bisnis.png', // Replace with the actual image path
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 20,
                              bottom: 2,
                              child: Text(
                                'Cari Ide Bisnis yang \nKamu Inginkan',
                                style: TextStyle(
                                  fontFamily: 'Odudo-Soft',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: const Offset(-3, 3),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Container(
                      width: 330, // atur lebar sesuai kebutuhan
                      height: 105, // atur tinggi sesuai kebutuhan
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromARGB(255, 213, 241, 194),
                            lightGreen,
                            lightGreen,
                            Color.fromARGB(255, 166, 240, 124),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          //ganti ke kelola sampah dari user
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Remove padding
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 6,
                              bottom: 0,
                              child: Image.asset(
                                'assets/sampah.png', // Replace with the actual image path
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              right: 30,
                              top: 20,
                              bottom: 2,
                              child: Text(
                                'Ayo Siapkan \nBank Sampahmu',
                                style: TextStyle(
                                  fontFamily: 'Odudo-Soft',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: const Offset(-3, 3),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.right,
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
            // bottomNavigationBar:

            // bottomNavigationBar: BottomNavBar(
            //   currentIndex: _selectedIndex,
            //   onTap: (index) {
            //     setState(() {
            //       _selectedIndex = index;
            //     });
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}
