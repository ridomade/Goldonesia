import 'package:flutter/material.dart';
import 'package:goldonesia/components/wideButton.dart';
import 'package:goldonesia/components/reusableTextfield.dart';
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
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock_outline_rounded,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // hello there!
                Text(
                  'Hello There!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),

                const SizedBox(height: 25),

                // Email
                ReusableTextfield(
                  controller: emailController,
                  hintText: "Email",
                  obsecureText: false,
                ),

                const SizedBox(height: 10),

                // Password
                ReusableTextfield(
                  controller: passwordController,
                  hintText: "password",
                  obsecureText: true,
                ),

                const SizedBox(height: 10),

                // Forgot Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // login button
                wideButton(
                  text: "Login",
                  onTap: logInUser,
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: .5,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Text("dont have an account yet? "),
                            GestureDetector(
                              onTap: () {
                                // Navigate to the registration screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()),
                                );
                              },
                              child: const Text(
                                "register now!",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: .5,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
