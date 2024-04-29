import 'package:flutter/material.dart';
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
      body: Center(
        child: Text(userDetails['username']),
      ),
    );
  }
}
