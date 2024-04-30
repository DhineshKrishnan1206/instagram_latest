// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:instagram/providers/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> postOptions = {
    'Reel': 'assets/icons/video.png',
    'Post': 'assets/icons/profile.png',
    'Story': 'assets/icons/story.png',
    'Story Highlight': 'assets/icons/story.png',
    'Live': 'assets/icons/story.png',
    'Made for you': 'assets/icons/video.png',
    'Ad': 'assets/icons/video.png',
  };

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userDetails =
        Provider.of<UserProvider>(context).userDetails;
    return Scaffold(
      appBar: AppBar(
        title: Text(userDetails['username']),
        actions: [
          Container(
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Create",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                String imageUrl =
                                    postOptions.values.toList()[index];
                                String optionName =
                                    postOptions.keys.toList()[index];
                                return ListTile(
                                  leading: Image.asset(
                                    imageUrl,
                                    height: 20,
                                    width: 20,
                                  ),
                                  title: InkWell(
                                    onTap: () {
                                      print(optionName);
                                    },
                                    child: Text(optionName),
                                  ), // Changed title to Text widget
                                ); // Added comma here
                              },
                              itemCount: postOptions
                                  .length, // Set itemCount to the length of your list
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Image.asset(
                "assets/icons/add.png",
                height: 22,
                width: 22,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SettingsScreen(
                      userData: userDetails,
                    );
                  }));
                },
                child: const Icon(
                  Icons.menu,
                  size: 30,
                )),
          ),
        ],
      ),
      body: Center(
        child: Text(userDetails['username']),
      ),
    );
  }
}
