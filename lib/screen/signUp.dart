import 'package:flutter/material.dart';
import 'package:goldonesia/components/reusableTextfield.dart';
import 'package:goldonesia/components/wideButton.dart';
import 'package:goldonesia/screen/loginPage.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  //controller
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // log user in
  void signUpUser() {} // enter firebase auth

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

                //logo
                const Icon(
                  Icons.person,
                  size: 100,
                ),

                const SizedBox(height: 25),

                Text(
                  'Let\'s make an account for you',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),

                const SizedBox(height: 50),

                //Username
                ReusableTextfield(
                  controller: usernameController,
                  hintText: "Username",
                  obsecureText: false,
                ),

                const SizedBox(height: 10),

                //email
                ReusableTextfield(
                  controller: emailController,
                  hintText: "Email",
                  obsecureText: false,
                ),

                const SizedBox(height: 10),

                //Password
                ReusableTextfield(
                  controller: passwordController,
                  hintText: "Password",
                  obsecureText: true,
                ),

                const SizedBox(height: 10),

                //confirm password
                ReusableTextfield(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obsecureText: true,
                ),

                const SizedBox(height: 25),

                wideButton(
                  text: "Sign Up",
                  onTap: signUpUser,
                ),

                const SizedBox(height: 25),

                //have an acoount? log in right away!
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
                            const Text("Have an account? "),
                            GestureDetector(
                              onTap: () {
                                // Navigate to the registration screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                              child: const Text(
                                "Login right away!",
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
