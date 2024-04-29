import 'package:flutter/material.dart';
import 'package:instagram/screens/addPost_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/profile_screen.dart';
import 'package:instagram/screens/reel_screen.dart';
import 'package:instagram/screens/search_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  List pages = [
    HomeScreen(),
    SearchScreen(),
    addPost(),
    ReelScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) => {
                setState(() {
                  selectedIndex = index;
                })
              },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/search.png',
                    width: 20, height: 20),
                label: ""),
            BottomNavigationBarItem(
                icon:
                    Image.asset('assets/icons/add.png', width: 20, height: 20),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/video.png',
                    width: 20, height: 20),
                label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
          ]),
    );
  }
}
