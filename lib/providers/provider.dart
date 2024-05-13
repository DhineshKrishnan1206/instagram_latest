import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkModeEnabled = false;
  notifyListeners();
}

class UserProvider extends ChangeNotifier {
  Map<String, dynamic> userDetails = {'username': "", 'email': ""};
}
