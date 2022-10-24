// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 192, 91, 8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 50.5,
                right: 50.5,
                bottom: 185.5,
              ),
              child: Icon(
                FontAwesomeIcons.cloudBolt,
                color: Colors.white,
                size: 120.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 50.5,
                right: 50.5,
                bottom: 10.5,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: MaterialButton(
                  onPressed: () {
                    result == null
                        ? Navigator.pushNamed(
                            context,
                            "uploadscreen",
                          )
                        : Navigator.pushReplacementNamed(
                            context,
                            "home",
                          );
                  },
                  elevation: 0.0,
                  textColor: Colors.black,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.bolt),
                      SizedBox(width: 35.8),
                      Text(
                        "Get started with bolt",
                        style: TextStyle(
                          fontSize: 17.8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.5),
                  ),
                  height: 55.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
