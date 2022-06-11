import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innocart/login/reset/reset.dart';

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
enum AppState{
  SIGNUP,LOGIN,RESET;
}

class MainState extends State<MyApp>{
  AppState state = AppState.SIGNUP;


  @override
  Widget build(BuildContext context) {
    late Widget current;
    if(state == AppState.SIGNUP){
      current = SignUpPage(title: "Signup",onTouched: (){
        setState((){
          state = AppState.LOGIN;
        });

      });
    }
    else if(state == AppState.LOGIN){
      current = LogInPage(title: "Login",onTouched: (){
        setState((){
          state = AppState.SIGNUP;
        });

      }, onResetRequest: (){
        setState((){
          state = AppState.RESET;
        });
      });
    }
    else if(state == AppState.RESET){
      current = ResetPage(onClick: (){
        setState((){
          state = AppState.LOGIN;
        });

      });
    }

    return  MaterialApp(
      home: current
    );
  }

}



