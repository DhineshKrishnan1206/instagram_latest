// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:instagram/screens/bottomBar.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:instagram/providers/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Map<String, dynamic> userData = {};
  bool isLoggedIn = false;
  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      getLocalData();
    });
    super.initState();
  }

  void getLocalData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? username = prefs.getString('username');
      final String? email = prefs.getString('email');
      if (username != null || email != null) {
        Provider.of<UserProvider>(context, listen: false).userDetails = {
          'username': username,
          'email': email
        };
      }
      userData['username'] = username;
      userData['email'] = email;
      if (userData['usersname'] != "") {
        print("has Values");
        isLoggedIn = true;
      }
      if (isLoggedIn) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return BottomBar();
        }));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      }

      print(userData['email']);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.network(
                  "https://cdn-icons-png.flaticon.com/256/1384/1384063.png",
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "From",
              style: TextStyle(
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.red,
                    ], // Customize gradient colors
                  ).createShader(const Rect.fromLTWH(
                      0.0, 0.0, 100.0, 50.0)), // Adjust Rect as needed
              ),
            ),
            const SizedBox(height: 1), // Adjust the height as needed
            Text(
              "Facebook",
              style: TextStyle(
                  color: themeProvider.isDarkModeEnabled
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 18,
            )
          ],
        ),
      ),
    );
  }
}
