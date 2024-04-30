import 'package:flutter/material.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  Map<String, dynamic> userData = {};
  SettingsScreen({super.key, required this.userData});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void deleteLocalData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('username');
      await prefs.remove('email');
      await prefs.remove('password');

      // Navigate to SplashScreen and remove all routes up to it
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
        (route) => false,
      );
    } catch (e) {
      print("Error while Deleting user Data from local storage: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings and activity"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              deleteLocalData();
            },
            child: Text("Logout")),
      ),
    );
  }
}
