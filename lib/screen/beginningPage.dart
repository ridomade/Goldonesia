import 'package:flutter/material.dart';
import 'package:goldonesia/components/wideButton.dart';
import 'package:goldonesia/constants/color.dart';
import 'package:goldonesia/screen/loginPage.dart';
import 'package:goldonesia/screen/signUp.dart';
import 'package:google_fonts/google_fonts.dart';

class BeginningPage extends StatelessWidget {
  const BeginningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffc5e898),
            Color(0xFF29ADB2),
            Color(0xFF0766AD),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 285,
                ),
                const Text(
                  "Goldonesia.",
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Odudo-Soft',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Solusi Membangun Negeri",
                  style: GoogleFonts.nunito(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 80),
                WideButton(
                  text: "Mulai Sekarang",
                  buttonColor: blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                ),
                SizedBox(height: 20),
                WideButton(
                  text: "Masuk",
                  buttonColor: teal,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
