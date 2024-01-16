import 'package:flutter/material.dart';
import 'package:goldonesia/constants/color.dart';
import 'package:goldonesia/screen/ListIde.dart';
import 'package:goldonesia/screen/homePage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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
            children: [
              // Your first screen content
              HomePage(),
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
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
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
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icon_notification.png',
                        width: 24,
                        height: 24,
                      ),
                      label: '-----',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icon_profile.png',
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

// import 'package:flutter/material.dart';
// import 'package:goldonesia/constants/color.dart';

// class CustomBottomNavigation extends StatefulWidget {
//   @override
//   _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
// }

// class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 10,
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.only(
//           left: 10.0,
//           right: 10.0,
//           bottom: MediaQuery.of(context).padding.bottom + 32.0,
//         ),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(50)),
//           child: BottomNavigationBar(
//             currentIndex: _currentIndex,
//             onTap: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             items: [
//               BottomNavigationBarItem(
//                 icon: _currentIndex == 0
//                     ? Column(
//                         children: [
//                           Icon(Icons.home, color: white),
//                           SizedBox(height: 2),
//                           Container(
//                             height: 2,
//                             width: 20,
//                             color: white,
//                           ),
//                         ],
//                       )
//                     : Icon(Icons.home, color: white),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: _currentIndex == 1
//                     ? Column(
//                         children: [
//                           Icon(Icons.info, color: white),
//                           SizedBox(height: 2),
//                           Container(
//                             height: 2,
//                             width: 20,
//                             color: white,
//                           ),
//                         ],
//                       )
//                     : Icon(Icons.info, color: white),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: _currentIndex == 2
//                     ? Column(
//                         children: [
//                           Icon(Icons.mail, color: white),
//                           SizedBox(height: 2),
//                           Container(
//                             height: 2,
//                             width: 20,
//                             color: white,
//                           ),
//                         ],
//                       )
//                     : Icon(Icons.mail, color: white),
//                 label: '',
//               ),
//             ],
//             backgroundColor: blue,
//             selectedItemColor: white,
//             unselectedItemColor: white,
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:goldonesia/constants/color.dart';

// class BottomNavBar extends StatelessWidget {
//   int currentIndex = 0;
//     onTap: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               };
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Stack(
//           children: [
//             BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               showSelectedLabels: true,
//               showUnselectedLabels: false,
//               unselectedItemColor: Colors.white,
//               selectedItemColor: Colors.white,
//               backgroundColor: Color(0xFF0766AD),
//               selectedLabelStyle: TextStyle(color: Color(0xFF0C5E898)),
//               currentIndex: currentIndex,
//               onTap: onTap,
//               items: [
//                 BottomNavigationBarItem(
//                   icon: Image.asset(
//                     'assets/icon_home.png',
//                     width: 24, // Set the width of the image
//                     height: 24, // Set the height of the image
//                   ),
//                   label: '-----',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Image.asset(
//                     'assets/icon_menu.png',
//                     width: 24, // Set the width of the image
//                     height: 24, // Set the height of the image
//                   ),
//                   label: '-----',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Image.asset(
//                     'assets/icon_notification.png',
//                     width: 24, // Set the width of the image
//                     height: 24, // Set the height of the image
//                   ),
//                   label: '-----',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Image.asset(
//                     'assets/icon_profile.png',
//                     width: 24, // Set the width of the image
//                     height: 24, // Set the height of the image
//                   ),
//                   label: '-----',
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

