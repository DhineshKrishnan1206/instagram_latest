import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:instagram/providers/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Instagram",
          style: TextStyle(fontFamily: 'Instagram', fontSize: 30),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/heart.png',
                  height: 25,
                  width: 25,
                  color: themeProvider.isDarkModeEnabled
                      ? Colors.white
                      : Colors.black,
                ),
                const SizedBox(
                  width: 15,
                ),
                Image.asset(
                  "assets/icons/chat_top.png",
                  height: 25,
                  width: 25,
                  color: themeProvider.isDarkModeEnabled
                      ? Colors.white
                      : Colors.black,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
