import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkModeEnabled = false;
}

class UserProvider extends ChangeNotifier {
  Map<String, dynamic> userDetails = {'username': "", 'email': ""};
}
