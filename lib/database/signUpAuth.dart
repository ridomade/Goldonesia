import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> registerUser(
    String email, String password, String username) async {
  try {
    // Check password complexity
    if (!isPasswordComplex(password)) {
      print('Password harus mengandung angka, huruf besar, dan huruf kecil.');
      return;
    }

    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Successful registration
    print("Berhasil membuat akun");

    // Add user data to Firestore
    await addUserDataToFirestore(userCredential.user?.uid, email, username);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('Panjang password harus lebih dari enam karakter');
    } else if (e.code == 'email-already-in-use') {
      print('Email tersebut sudah digunakan');
    } else if (e.code == 'invalid-email') {
      print('Format email tidak valid');
    } else if (e.code == 'operation-not-allowed') {
      print('Operasi ini tidak diizinkan');
    } else {
      print('Terjadi kesalahan saat membuat akun: $e');
    }
  } catch (e) {
    print('Terjadi kesalahan umum: $e');
  }
}

bool isPasswordComplex(String password) {
  // Check if the password contains at least one digit, one uppercase letter, and one lowercase letter
  return RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])').hasMatch(password);
}

Future<void> addUserDataToFirestore(
    String? uid, String email, String username) async {
  try {
    if (uid != null) {
      await FirebaseFirestore.instance.collection('Users').doc(uid).set({
        'username': username,
        'email': email,
        'investorRole': false,
        'profileName':
            'https://firebasestorage.googleapis.com/v0/b/goldonesia-database.appspot.com/o/Users%2Fdefault_profile_photo.jpg?alt=media&token=d5f13064-c8a5-4fdb-a040-1735dab03d5e',
        'profileUrl': 'default_profile_photo.jpg',
      });
      print('User data added to Firestore');
    }
  } catch (e) {
    print('Error adding user data to Firestore: $e');
  }
}
