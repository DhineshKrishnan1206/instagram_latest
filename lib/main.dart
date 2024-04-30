import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/providers/provider.dart';
import 'package:instagram/screens/notFoundPage.dart';
import 'package:instagram/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkModeEnabled
          ? ThemeData.dark(useMaterial3: true).copyWith(
              textTheme: Typography().white.apply(fontFamily: 'InstagramSans'))
          : ThemeData.light(useMaterial3: true).copyWith(
              textTheme: Typography().black.apply(fontFamily: 'InstagramSans')),
      home: SplashScreen(),
    );
  }
}
