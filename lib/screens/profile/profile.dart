// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(user!.photoURL!),
                radius: 85.5,
              ),
            ),
            SizedBox(height: 12.5),
            Container(
              child: Text(
                "Name: ${user.displayName}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12.5),
            Container(
              child: Text(
                "Email: ${user.displayName}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
