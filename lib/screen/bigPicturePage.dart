import 'package:flutter/material.dart';
import 'package:goldonesia/components/reusableTextfield.dart';
import 'package:goldonesia/components/wideButton.dart';
import 'package:goldonesia/constants/color.dart';

class BigPicture extends StatelessWidget {
  BigPicture({super.key});

  final ideController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
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
                              "Detail Ide Kamu",
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
                      label: "Nama Ide",
                      controller: ideController,
                      obscureText: false),

                  SizedBox(height: 120),

                  WideButton(text: "Submit", buttonColor: blue)

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
