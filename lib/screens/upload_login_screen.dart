// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upload/auth/upload_auth_service.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Scaffold(
            backgroundColor: Color.fromARGB(255, 192, 91, 8),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bolt Local Storage",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 250,
                    child: Icon(
                      FontAwesomeIcons.cloudBolt,
                      size: 120.5,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 50.5,
                      right: 50.5,
                      bottom: 8.5,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: MaterialButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          FireBaseService service = FireBaseService();
                          try {
                            await service.signInWithGoogle();
                            Navigator.pushNamedAndRemoveUntil(
                                context, "home", (route) => false);
                          } catch (e) {
                            if (e is FirebaseAuthException) {
                              showMessage(e.message!);
                            }
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 0.0,
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.google),
                            SizedBox(width: 29.5),
                            Text(
                              "Sign in with google",
                              style: TextStyle(
                                fontSize: 20.5,
                              ),
                            ),
                          ],
                        ),
                        textColor: Colors.black,
                        height: 55.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SpinKitCircle(
            color: Colors.white,
            size: 55.8,
          );
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
