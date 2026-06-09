import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/Views/leaderboard.dart';
import 'package:flutter_firebase_quiz_app/Views/profile_screen.dart';
import 'package:flutter_firebase_quiz_app/Views/quiz_category.dart';
import 'package:flutter_firebase_quiz_app/Widgets/app_theme.dart';

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
      backgroundColor: AppTheme.background,
      body: PageStorage(
        bucket: bucket,
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white.withOpacity(0.05),
              width: 1.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppTheme.surface,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedItemColor: AppTheme.secondary,
          unselectedItemColor: AppTheme.textMuted,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Icon(Icons.grid_view_rounded),
              ),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Icon(Icons.leaderboard_rounded),
              ),
              label: "Leaderboard",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Icon(Icons.person_rounded),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
