import 'package:flutter/material.dart';
import 'package:instagram/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Instagram",
              style: TextStyle(fontFamily: 'Instagram', fontSize: 45),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE0DDDD))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        fillColor: Color(0xffE8E6E6),
                        labelText: "Username"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE0DDDD))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        fillColor: Color(0xffE8E6E6),
                        labelText: "Email"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE0DDDD))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        fillColor: Color(0xffE8E6E6),
                        labelText: "Password"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize:
                    const Size(350, 50), // Width and height of the button
                backgroundColor: const Color(0xff1877F2).withOpacity(0.7),
                textStyle: const TextStyle(color: Colors.white),
                padding: const EdgeInsets.symmetric(vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  child: const Text(
                    "log in.",
                    style: TextStyle(
                        color: Color(0xff1877F2), fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
