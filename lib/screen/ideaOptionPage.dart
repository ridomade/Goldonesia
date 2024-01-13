import 'package:flutter/material.dart';
import 'package:goldonesia/components/reusableContainer.dart';
import 'package:goldonesia/constants/color.dart';
import 'package:google_fonts/google_fonts.dart';

class IdeaOption extends StatelessWidget {
  const IdeaOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [lightGreen, lightGreen, white, white, white, white, teal],
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
                          Icons.arrow_back,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

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
                              "Ayo Ajukan Ide Milikmu",
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
                  ////////////////////////////
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 10),
                          blurRadius: 8,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/3.png', // Provide the correct image path
                          width: 150,
                          height: 150,
                        ),
                        SizedBox(
                            width:
                                10), // Adjust the spacing between image and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Gambaran\n Besar ide",
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Punya Gambaran Besar\nIde? Kamu juga\nbisa menyalurkannya",
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 10),
                          blurRadius: 8,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Salurkan Ide mu",
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Ide sudah matang?,\nlangsung ajukan saja",
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            width:
                                10), // Adjust the spacing between image and text
                        Image.asset(
                          'images/4.png', // Provide the correct image path
                          width: 150,
                          height: 150,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
