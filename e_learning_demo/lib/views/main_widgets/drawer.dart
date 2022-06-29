import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class drawer extends StatelessWidget {
final  User? user;
  const drawer({
     this.user,
  });


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(user!.email!.split("@")[0]), accountEmail: Text(user!.email!)),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);

                if (user==null) {
                  Navigator.pop(context);
                }
              },
              child: Text("Sign out")),
        ],
      ),
    );
  }
}
