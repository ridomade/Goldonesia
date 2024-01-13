import "package:flutter/material.dart";
import "package:goldonesia/constants/color.dart";
import "package:goldonesia/screen/beginningPage.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController pageController = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (idx) {
              setState(() {
                onLastPage = (idx == 1);
              });
            },
            controller: pageController,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xffc5e898),
                      Color(0xFF29ADB2),
                      Color(0xFF0766AD),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/1.png'),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 60), // Adjust the left padding as needed
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Hubungkan Ide\nBisnismu ke\nInvestor',
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Odudo-Soft',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // container 2#
              Container(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 60), // Adjust the left padding as needed
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Kelola Sampah\nDemi Lingkungan\nYang Lebih Baik',
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Odudo-Soft',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Image.asset('images/2.png'),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(""),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 2,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.white,
                    activeDotColor: Color(0xFFd9d9d9),
                  ),
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BeginningPage()),
                          );
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
