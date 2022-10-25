// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:upload/firebase_options.dart';
import 'package:upload/screens/profile/profile.dart';
import 'package:upload/screens/upload_login_screen.dart';
import 'package:upload/screens/upload_screen.dart';
import 'package:upload/widget/welcome_upload_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox("document_box");
  runApp(Upload());
}

class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Upload",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomePage(),
        "uploadscreen": (context) => UploadScreen(),
        "home": (context) => HomeScreen(),
        "profile": (context) => ProfileScreen(),
      },
    );
  }
}
