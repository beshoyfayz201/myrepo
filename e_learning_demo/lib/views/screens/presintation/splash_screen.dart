import 'package:e_learning_demo/app_style/size_config.dart';
import 'package:e_learning_demo/models/algorithm.dart';
import 'package:e_learning_demo/models/exam_model.dart';
import 'package:e_learning_demo/views/screens/exam_screen/exam_screen.dart';
import 'package:rive/rive.dart';
import 'package:e_learning_demo/views/screens/home_screen.dart';
import 'package:e_learning_demo/views/screens/register/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String id = "SplashScreen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Future.delayed(Duration(milliseconds: 3600),
        () => Navigator.of(context).pushReplacementNamed(Root.id));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/s0.jpeg"),
              fit: BoxFit.fitHeight),
        ),
        child: Center(
          child: RiveAnimation.asset(
            "assets/rivs/logo.riv",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class Root extends StatelessWidget {
  static const String id = "Root";
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) => snapshot.hasData
          ? HomeScreen(isLogin: false)
          //HomeScreen(isLogin: false)
          : SignupScreen(),
      stream: FirebaseAuth.instance.authStateChanges(),
    );
  }
}
