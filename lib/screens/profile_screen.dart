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
    var themeProvider = Provider.of<ThemeProvider>(context);
    Map<String, dynamic> userDetails =
        Provider.of<UserProvider>(context).userDetails;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            userDetails['username'],
            style: TextStyle(
                color: themeProvider.isDarkModeEnabled
                    ? Colors.white
                    : Colors.black),
          ),
          actions: [
            Container(
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Builder(builder: (context) {
                        var themeProvider = Provider.of<ThemeProvider>(context);
                        return Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Create",
                                style: TextStyle(
                                    color: themeProvider.isDarkModeEnabled
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                      });
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFF505050),
                  ),
                  Column(
                    children: [
                      Text(
                        "73",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("posts")
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "593",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("followers")
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "939",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("following")
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(top: 0, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dhinesh",
                    style: TextStyle(
                        fontFamily: 'Instagram', fontStyle: FontStyle.italic),
                  ),
                  Text("Artist"),
                  Text(
                    "Introvert",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Musician | Editor"),
                  Row(
                    children: [
                      Icon(Icons.link),
                      SizedBox(
                        width: 5,
                      ),
                      Text("youtube.com/@DhineshKrishnan")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 380,
                    height: 40,
                    color: Colors.black,
                    child: Column(
                      children: [Text("Professional Dashboard")],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
