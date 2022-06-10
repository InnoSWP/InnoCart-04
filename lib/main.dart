import 'dart:math';

import 'package:flutter/material.dart';

import 'package:innocart/signup/signup.dart';
import 'package:innocart/login/login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() => MainState();
}
class MainState extends State<MyApp>{
  bool signup = true;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: signup?SignUpPage(title: "Signup",onTouched: (){
        setState((){
          signup = false;
        });

      }):LogInPage(title: "Login",onTouched: (){
        setState((){
          signup = true;
        });

      }),

    );
  }

}



