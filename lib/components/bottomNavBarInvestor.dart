import 'package:flutter/material.dart';
import 'package:goldonesia/screen/ListIde.dart';
import 'package:goldonesia/screen/homePageInvestor.dart';

class BottomNavBarInvestor extends StatefulWidget {
  const BottomNavBarInvestor({Key? key}) : super(key: key);

  @override
  _BottomNavBarInvestorState createState() => _BottomNavBarInvestorState();
}

class _BottomNavBarInvestorState extends State<BottomNavBarInvestor> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: const [
              // Your first screen content
              HomePageInvestor(),
              // Your second screen content
              ListIde(),
              // Add more screens as needed
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 120, right: 120, bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  unselectedItemColor: Colors.white,
                  selectedItemColor: Colors.white,
                  backgroundColor: Color(0xFF0766AD),
                  selectedLabelStyle: TextStyle(color: Color(0xFF0C5E898)),
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icon_home.png',
                        width: 24,
                        height: 24,
                      ),
                      label: '-----',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icon_menu.png',
                        width: 24,
                        height: 24,
                      ),
                      label: '-----',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
