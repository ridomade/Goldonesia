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

import 'package:flutter/material.dart';
import 'package:goldonesia/constants/color.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.white,
              backgroundColor: Color(0xFF0766AD),
              selectedLabelStyle: TextStyle(color: Color(0xFF0C5E898)),
              currentIndex: currentIndex,
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_home.png',
                    width: 24, // Set the width of the image
                    height: 24, // Set the height of the image
                  ),
                  label: '-----',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_menu.png',
                    width: 24, // Set the width of the image
                    height: 24, // Set the height of the image
                  ),
                  label: '-----',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_notification.png',
                    width: 24, // Set the width of the image
                    height: 24, // Set the height of the image
                  ),
                  label: '-----',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_profile.png',
                    width: 24, // Set the width of the image
                    height: 24, // Set the height of the image
                  ),
                  label: '-----',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
