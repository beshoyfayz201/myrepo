import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_demo/app_style/size_config.dart';
import 'package:e_learning_demo/control/loader.dart';
import 'package:e_learning_demo/control/validator.dart';
import 'package:e_learning_demo/views/main_widgets/text_field.dart';
import 'package:e_learning_demo/views/main_widgets/titles.dart';
import 'package:e_learning_demo/views/screens/algorithm/alg_main_screen.dart';
import 'package:e_learning_demo/views/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController emailCont = TextEditingController();
  TextEditingController nameCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email, name, pass;

  static const String id = "SignupScreen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<Loader>(context).isLoading,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(
                  "assets/images/abck.png",
                  fit: BoxFit.cover,
                ),
                height: SizeConfig.height! * 0.3,
                width: SizeConfig.width,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.defaultsize!),
                child: const TitleBlueY8(
                  txt: "Create your Account",
                  size: 35,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitleBlueY8(txt: "Already have an account", size: 22),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.id);
                    },
                    child: const TitleBluedY8(
                      txt: "Log in",
                      size: 25,
                    ),
                  )
                ],
              ),

              //_______________________________________________________________
              Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultsize! * 3,
                        vertical: SizeConfig.defaultsize! * 0.8),
                    child: Column(
                      children: [
                        CustomTextField(
                            vfun: (e) => Validator.isEmail(e)
                                ? null
                                : "please enter a valid Email",
                            onChanged: (v) {
                              email = v;
                            },
                            icon: Icons.email,
                            controller: emailCont,
                            isSecured: false,
                            label: "Email"),
                        CustomTextField(
                            vfun: (p) => Validator.isValidPassword(p)
                                ? null
                                : "not valid password",
                            onChanged: (v) {
                              pass = v;
                            },
                            icon: Icons.lock_outline,
                            controller: passCont,
                            isSecured: true,
                            label: "Password"),
                        CustomTextField(
                            onChanged: (v) {
                              name = v;
                            },
                            icon: Icons.person_outline,
                            controller: nameCont,
                            isSecured: false,
                            label: "name"),
                        ElevatedButton(
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState!.validate()) {
                                try {
                                  Provider.of<Loader>(context, listen: false)
                                      .changeLoaderState();
                                  var cre = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: email!.trim(),
                                          password: pass!.trim())
                                      .then((value) {
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(value.user!.uid)
                                        .set({
                                      "name": name!.trim(),
                                      "pass": pass!.trim(),
                                      "tokken": value.user!.uid
                                    });
                                    
                              Provider.of<Loader>(context, listen: false)
                                  .changeLoaderState();
                                  });

                                  emailCont.clear();
                                  passCont.clear();
                                  nameCont.clear();

                                  Provider.of<Loader>(context, listen: false)
                                      .changeLoaderState();
                                  Navigator.of(context)
                                      .pushReplacementNamed(HomeScreen.id);
                                } on FirebaseAuthException catch (e) {
                                  Provider.of<Loader>(context, listen: false)
                                      .changeLoaderState();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(e.code.toString())));
                                } catch (e) {
                                  Provider.of<Loader>(context, listen: false)
                                      .changeLoaderState();
                                  print(e);
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: SizeConfig.defaultsize! + 10),
                                )
                              ],
                            )),
                        IntrinsicWidth(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Card(
                                  color: Colors.blue.shade100,
                                  child: SizedBox(
                                    width: SizeConfig.width! / 2 -
                                        SizeConfig.defaultsize!,
                                    height: 1,
                                  ),
                                ),
                              ),
                              const Text(
                                "OR",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600),
                              ),
                              Expanded(
                                child: Card(
                                  color: Colors.blue.shade100,
                                  child: const SizedBox(
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
