import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> getUser() async {
  try {
    final docRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid);

    final snapshot = await docRef.get();

    if (snapshot.exists) {
      // Jika dokumen ada, kembalikan nilai dari field 'username'
      return snapshot['username'];
    } else {
      // Jika dokumen tidak ada, bisa menangani sesuai kebutuhan Anda
      return 'Dokumen tidak ditemukan';
    }
  } catch (error) {
    print("Error: $error");
    // Tangani error sesuai kebutuhan Anda
    return 'Terjadi kesalahan';
  }
}
