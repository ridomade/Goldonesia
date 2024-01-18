import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SideProfile extends StatefulWidget {
  @override
  _SideProfileState createState() => _SideProfileState();
}

class _SideProfileState extends State<SideProfile> {
  String userProfile =
      'https://firebasestorage.googleapis.com/v0/b/goldonesia-database.appspot.com/o/Users%2Fdefault_profile_photo.jpg?alt=media&token=d5f13064-c8a5-4fdb-a040-1735dab03d5e';
  String userUsername = "UserName";

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() {
    final docRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    docRef.snapshots().listen(
      (event) {
        setState(() {
          userUsername = event['username'];
          userProfile = event['profileURL'];
        });
      },
      onError: (error) => print("Listen failed: $error"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                    child: Image.network(
                      userProfile,
                      width: 120,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(width: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userUsername,
                      style: TextStyle(
                        color: Color(0xFF0766AD),
                        fontSize: 24,
                      ),
                    ),
                    // Add additional text or widgets as needed
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Item 1',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Handle item tap
            },
          ),
          ListTile(
            title: Text(
              'Item 2',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Handle item tap
            },
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}
