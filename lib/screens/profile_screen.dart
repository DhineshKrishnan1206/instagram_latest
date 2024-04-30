import 'package:flutter/material.dart';
import 'package:instagram/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:instagram/providers/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userDetails =
        Provider.of<UserProvider>(context).userDetails;
    return Scaffold(
      appBar: AppBar(
        title: Text(userDetails['username']),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SettingsScreen(
                      userData: userDetails,
                    );
                  }));
                },
                child: const Icon(Icons.menu)),
          )
        ],
      ),
      body: Center(
        child: Text(userDetails['username']),
      ),
    );
  }
}
