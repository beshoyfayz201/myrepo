import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_demo/app_style/colors.dart';
import 'package:e_learning_demo/app_style/size_config.dart';
import 'package:e_learning_demo/views/main_widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_buble.dart';
import 'new_message.dart';

class ChatScreen extends StatefulWidget {
  static const String id = "ChatScreen";
  User? u = FirebaseAuth.instance.currentUser;

  var userData;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController cont = TextEditingController();
  String m = " ";

  init() async {
    widget.userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.u!.uid)
        .get();
  }

  @override
  void initState() {
    //  init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(user: FirebaseAuth.instance.currentUser!),
      appBar: AppBar(backgroundColor: Colors.grey),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/chatbck.jpg"),
                fit: BoxFit.fill)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("c")
                      .orderBy("at", descending: true)
                      .snapshots(),
                  builder: (ctx, AsyncSnapshot snapshots) => snapshots
                              .connectionState ==
                          ConnectionState.waiting
                      ? Padding(
                          padding: EdgeInsets.all(SizeConfig.defaultsize! * 2),
                          child:
                              const Center(child: CircularProgressIndicator()),
                        )
                      : Expanded(
                          child: ListView.builder(
                              reverse: true,
                              itemCount: snapshots.data!.docs.length,
                              itemBuilder: (context, i) => MeassageBuble(
                                  snapshots.data!.docs[i]['name'],
                                  snapshots.data.docs[i]['id'] == widget.u!.uid,
                                  snapshots.data.docs[i]["txt"],
                                  ValueKey(snapshots.data.docs[i].id))),
                        )),
              NewMeassage()
            ],
          ),
        ),
      ),
    );
  }
}
