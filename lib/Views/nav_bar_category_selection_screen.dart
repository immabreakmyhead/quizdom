import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/Views/leaderboard.dart';
import 'package:flutter_firebase_quiz_app/Views/profile_screen.dart';
import 'package:flutter_firebase_quiz_app/Views/quiz_category.dart';

class NavBarCategorySelectionScreen extends StatefulWidget {
  final int initialIndex;
  const NavBarCategorySelectionScreen({super.key, this.initialIndex = 0});

  @override
  State<NavBarCategorySelectionScreen> createState() =>
      _NavBarCategorySelectionScreenState();
}

class _NavBarCategorySelectionScreenState
    extends State<NavBarCategorySelectionScreen> {
  final PageStorageBucket bucket = PageStorageBucket();
  final pages = [
    const QuizCategory(),
   const Leaderboard(),
   const ProfileScreen()
  ];
  late int selectedIndex;
  @override
  void initState() {
    selectedIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: pages[selectedIndex],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        // Added horizontal padding around icons to increase spacing between them
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.category),
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.leaderboard),
            ),
            label: "Leaderboard",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.person),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
