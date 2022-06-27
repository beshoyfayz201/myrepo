import 'package:e_learning_demo/control/loader.dart';
import 'package:e_learning_demo/control/monitor.dart';
import 'package:e_learning_demo/views/screens/chat_screen/chat_screen.dart';
import 'package:e_learning_demo/views/screens/home_screen.dart';
import 'package:e_learning_demo/views/screens/presintation/splash_screen.dart';
import 'package:e_learning_demo/views/screens/register/login_screen.dart';
import 'package:e_learning_demo/views/screens/register/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Alpha());
}

//
//
//
class Alpha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Loader()),
        ChangeNotifierProvider(create: (_) => Monitor()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 17),
              subtitle1: TextStyle(fontSize: 17),
            )),
        routes: {
          "/": (context) => SplashScreen(),
          // "/": (context) => HomeScreen(
          //      isLogin: true,
          //   ),
          
          Root.id: (context) => Root(),
          SignupScreen.id: (context) => SignupScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          HomeScreen.id: (context) => HomeScreen(isLogin: true),
          ChatScreen.id: (context) => ChatScreen(),
        },
      ),
    );
  }
}
