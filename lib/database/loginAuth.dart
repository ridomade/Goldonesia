import 'package:firebase_auth/firebase_auth.dart';

Future<bool> loginUser(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Successful login
    print("Berhasil login");

    // Access user information using userCredential.user
    User? user = userCredential.user;

    if (user != null) {
      print('User UID: ${user.uid}');
      print('User email: ${user.email}');
      // Add other user-related information as needed
    }
    return true;
  } on FirebaseAuthException catch (e) {
    print("Email atau password salah");
  } catch (e) {
    print('Error: Terjadi kesalahan umum: $e');
  }
  return false;
}
