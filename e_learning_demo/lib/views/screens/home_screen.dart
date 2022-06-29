import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:e_learning_demo/models/algorithm.dart';
import 'package:e_learning_demo/views/screens/algorithm/algorithm_widgets/category_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../main_widgets/drawer.dart';
import 'chat_screen/chat_screen.dart';
import 'package:http/http.dart' as http;
//third party
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "HomeScreen";

  bool isLogin;
  HomeScreen({required this.isLogin});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Algorithm> algo = [
    naiveAlgorithm,
    huffman,
    kmpAlgorithm,
    suffixArrayAlgorithm
  ];
  bool isopen = false;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  testa() async {
    http.Response r = await http.post(
        Uri.parse(
          "http://10.0.2.2:44272/api/user/createalgorithm",
        ),
        body: jsonEncode(naiveAlgorithm.getMap()),
        headers: <String, String>{
          'Content-Type': 'application/json;Charset=UTF-8'
        });
    print("\n\n\n_______" + jsonDecode(r.body));
  }

  @override
  void initState() {
    testa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: ChatActionButton(),
        backgroundColor: Colors.white,
        key: _scaffoldkey,
        appBar: AppBar(
          leading: Container(),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _scaffoldkey.currentState!.openEndDrawer();
                  });
                },
                icon: Icon(
                  Icons.list,
                  color: Colors.grey.shade600,
                ))
          ],
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
          title: Text(
            "ALPHA chapters",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        endDrawer: drawer(user: FirebaseAuth.instance.currentUser),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemCount: algo.length,
            itemBuilder: (context, k) => AnimationConfiguration.staggeredList(
              duration: Duration(seconds: 2),
              position: k,
              child: SlideAnimation(
                duration: Duration(seconds: 1),
                curve: Curves.bounceIn,
                child: FlipAnimation(
                  duration: Duration(milliseconds: 1500),
                  child: CategoryItem(a: algo[k], i: k),
                ),
              ),
            ),
          ),
        ));
  }
}

class ChatActionButton extends StatelessWidget {
  const ChatActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 10,
        onPressed: () {
          Navigator.of(context).pushNamed(ChatScreen.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/but.png",
            fit: BoxFit.contain,
          ),
        ));
  }
}
