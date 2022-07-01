import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class drawer extends StatelessWidget {
  final User? user;
  const drawer({
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPictureSize: Size(200, 200),
              accountName: Text(user!.email!.split("@")[0]),
              accountEmail: Text(user!.email!)),
          Stack(
            children: [
              Image.asset("assets/images/chemical.png"),
              Column(
                children: [
                  ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        if (user == null) {
                          Navigator.pop(context);
                        }
                      },
                      title: Text("Home"),
                      leading: Icon(Icons.home)),
                  ListTile(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pop(context);

                        if (user == null) {
                          Navigator.pop(context);
                        }
                      },
                      title: Text("Sign out"),
                      leading: Icon(Icons.exit_to_app)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
