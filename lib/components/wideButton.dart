import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WideButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color buttonColor;

  const WideButton(
      {Key? key, this.onTap, required this.text, required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(0, 4),
                  blurRadius: 8,
                  spreadRadius: 0),
            ]),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
