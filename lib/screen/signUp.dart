import 'package:flutter/material.dart';
import 'package:goldonesia/components/reusableTextfield.dart';
import 'package:goldonesia/components/wideButton.dart';
import 'package:goldonesia/constants/color.dart';
import 'package:goldonesia/database/signUpAuth.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  //controller
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // log user in

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            lightGreen,
            lightGreen,
            white,
            white,
            white,
            white,
            white,
            white,
            teal
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  const Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.close,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the column vertically
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Center the children horizontally
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center the row horizontally
                          children: [
                            Text(
                              "Lengkapi Data Diri",
                              style: TextStyle(
                                fontFamily: 'Odudo-Soft',
                                color: Color(0xFF0766AD),
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign
                                  .center, // Center the text within the row
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center the row horizontally
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 125,
                                  height: 6,
                                  decoration: ShapeDecoration(
                                    color: blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 13),
                                Container(
                                  width: 12,
                                  height: 6,
                                  decoration: ShapeDecoration(
                                    color: blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  //Email
                  ReusableTextField(
                      label: "Email",
                      controller: emailController,
                      obscureText: false),

                  const SizedBox(height: 17),

                  //Username
                  ReusableTextField(
                      label: "Username",
                      controller: usernameController,
                      obscureText: false),

                  const SizedBox(height: 17),

                  //Password
                  ReusableTextField(
                      label: "Password",
                      controller: passwordController,
                      obscureText: true),

                  const SizedBox(height: 5),
                  const Text(
                    "Minimal 6 karakter berupa kombinasi angka, huruf besar, dan huruf kecil",
                    style: TextStyle(fontSize: 10),
                  ),

                  const SizedBox(height: 17),

                  //confirm password
                  ReusableTextField(
                      label: "Confirm Password",
                      controller: confirmPasswordController,
                      obscureText: true),

                  const SizedBox(height: 50),

                  WideButton(
                    text: "Buat akun",
                    buttonColor: blue,
                    onTap: () async {
                      if (usernameController.text == "" &&
                          emailController.text == "" &&
                          passwordController.text == "" &&
                          confirmPasswordController.text == "") {
                        print("Anda harus mengisi semua kolom.");
                      } else if (usernameController.text == "") {
                        print("Anda belum mengisi username");
                      } else if (emailController.text == "") {
                        print("Anda belum mengisi email");
                      } else if (passwordController.text == "") {
                        print("Anda belum mengisi password");
                      } else if (confirmPasswordController.text == "") {
                        print("Anda belum mengisi konfirmasi password");
                      } else {
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          await registerUser(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              usernameController.text);
                        } else {
                          print("Password tidak sama");
                        }
                      }
                    }, //Homepage Belom ada desain
                  ),

                  const SizedBox(height: 25),

                  //have an acoount? log in right away!
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
