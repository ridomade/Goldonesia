import 'package:flutter/material.dart';
import 'package:goldonesia/components/wideButton.dart';
import 'package:goldonesia/components/reusableTextfield.dart';
import 'package:goldonesia/constants/color.dart';
import 'package:goldonesia/database/loginAuth.dart';
import 'package:goldonesia/screen/signUp.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // log user in
  void logInUser() {} // enter firebase auth

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [lightGreen, lightGreen, white, white, teal],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 50),

                  // logo
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: .0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        WideButton(
                          text: "Daftar",
                          buttonColor: blue,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 45),

                  // Masuk ke akun kamu
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Masuk ke\nakun kamu",
                              style: TextStyle(
                                fontFamily: 'Odudo-Soft',
                                color: Color(0xFF0766AD),
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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

                  const SizedBox(height: 25),

                  // Email
                  ReusableTextField(
                      label: "Email",
                      controller: emailController,
                      obscureText: false),

                  const SizedBox(height: 10),

                  // Password

                  ReusableTextField(
                      label: "Password",
                      controller: passwordController,
                      obscureText: true),

                  const SizedBox(height: 20),

                  // Forgot Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Lupa Password?",
                          style: TextStyle(
                            color: blue,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // login button
                  WideButton(
                    text: "Masuk",
                    buttonColor: blue,
                    onTap: () async {
                      // log user in
                      if (emailController.text == "" &&
                          passwordController.text == "") {
                        print("Email dan password tidak boleh kosong");
                      } else if (emailController.text == "") {
                        print("Email tidak boleh kosong");
                      } else if (passwordController.text == "") {
                        print("Password tidak boleh kosong");
                      } else
                        await loginUser(
                            emailController.text, passwordController.text);
                    },
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
