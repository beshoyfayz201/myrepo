import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMeassage extends StatefulWidget {
  @override
  _NewMeassageState createState() => _NewMeassageState();
}

class _NewMeassageState extends State<NewMeassage> {
  TextEditingController cont = TextEditingController();
  User u = FirebaseAuth.instance.currentUser!;
  String? m;

  send() async {
    final userdata =
        await FirebaseFirestore.instance.collection("users").doc(u.uid).get();
    try {
      await FirebaseFirestore.instance.collection("c").add({
        "name": userdata["name"],
        "txt": m,
        "at": Timestamp.now(),
        "id": u.uid
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: SnackBar(content: Text(e.toString()))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: cont,
              style: TextStyle(color: Colors.black, fontSize: 20),
              decoration: InputDecoration(
                  hintText: "Say something",
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.5)),
              onChanged: (v) {
                setState(() {
                  m = v;
                });
                print(cont.text);
              },
            ),
          ),
          IconButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
                await send();

                cont.clear();
                m = "";
              },
              icon: Icon(
                Icons.send,
                color: cont.text.isEmpty ? Colors.grey : Colors.blue,
              ))
        ],
      ),
    );
  }
}
