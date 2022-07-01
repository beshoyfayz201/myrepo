import 'dart:convert';

import 'package:e_learning_demo/control/loader.dart';
import 'package:e_learning_demo/control/monitor.dart';
import 'package:e_learning_demo/models/algorithm.dart';
import 'package:e_learning_demo/service/endpoints.dart';
import 'package:e_learning_demo/views/screens/chat_screen/chat_screen.dart';
import 'package:e_learning_demo/views/screens/home_screen.dart';
import 'package:e_learning_demo/views/screens/presintation/splash_screen.dart';
import 'package:e_learning_demo/views/screens/register/login_screen.dart';
import 'package:e_learning_demo/views/screens/register/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

post(Map a) async {
  http.Response r = await http.post(
      Uri.parse(
        home+postTopic,
      ),
      body: jsonEncode(a),
      headers: <String, String>{
        'Content-Type': 'application/json;Charset=UTF-8'
      });
  print("\n\n\n_______" + jsonDecode(r.body).toString());
}

// get() async {
//     http.Response r = await http.get(
//         Uri.parse(
//           "http://10.0.2.2:44272/api/user/getallalgorithms",
//         ),

//         headers: <String, String>{
//           'Content-Type': 'application/json;Charset=UTF-8'
//         });
//     print("\n\n\n_______" + jsonDecode(r.body)[0]['intro']);
//   }
void main() async {
//  http.Response r= await post(huffman.topics[0].getMap());
//  http.Response r2= await post(huffman.topics[1].getMap());

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
