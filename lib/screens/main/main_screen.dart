import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_ui/screens/home/home_screen.dart';
import 'package:movies_ui/screens/popular/popular_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedBottomNavigation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: selectedBottomNavigation,
        children: getScreens(),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.35),
          borderRadius: BorderRadius.circular(35),
        ),
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: BottomNavigationBar(
              onTap: (int index) {
                setState(() {
                  selectedBottomNavigation = index;
                });
              },
              currentIndex: selectedBottomNavigation,
              selectedIconTheme: const IconThemeData(
                color: Colors.yellow,
              ),
              backgroundColor: Colors.white.withOpacity(.35),
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_camera_back_rounded),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_activity),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> getScreens() {
  return <Widget>[
    const HomeScreen(),
    const PopularScreen(),
    Container(
      color: Colors.black,
    ),
  ];
}
