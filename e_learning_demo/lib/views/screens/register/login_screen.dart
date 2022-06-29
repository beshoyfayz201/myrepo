import 'package:e_learning_demo/app_style/colors.dart';
import 'package:e_learning_demo/app_style/size_config.dart';
import 'package:e_learning_demo/control/loader.dart';
import 'package:e_learning_demo/control/validator.dart';
import 'package:e_learning_demo/views/main_widgets/login_meathods.dart';
import 'package:e_learning_demo/views/main_widgets/text_field.dart';
import 'package:e_learning_demo/views/main_widgets/titles.dart';
import 'package:e_learning_demo/views/screens/algorithm/alg_main_screen.dart';
import 'package:e_learning_demo/views/screens/home_screen.dart';
import 'package:e_learning_demo/views/screens/register/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email, pass;

  static const String id = "LoginScreen";
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
                child: TitleBluedY8(
                  txt: "Welcome back ",
                  size: 25,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitleBluethin(txt: "Already have an account", size: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignupScreen.id);
                    },
                    child: const TitleBluedY8(
                      txt: "Signup",
                      size: 20,
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
                            vfun: (p) => Validator.isEmail(p)
                                ? null
                                : "please enter a valid email",
                            onChanged: (v) {
                              email = v;
                              print(email);
                            },
                            icon: Icons.email,
                            controller: emailCont,
                            isSecured: false,
                            label: "Email"),
                        CustomTextField(
                            vfun: (p) => Validator.isValidPassword(p)
                                ? null
                                : "please enter at least 6 charachters",
                            onChanged: (v) {
                              pass = v;

                              print(pass);
                            },
                            icon: Icons.lock_outline,
                            controller: passCont,
                            isSecured: true,
                            label: "Password"),
                        ElevatedButton(
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState!.validate()) {
                                try {
                                  Provider.of<Loader>(context, listen: false)
                                      .changeLoaderState();
                                  var cre = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: email!.trim(),
                                          password: pass!.trim());

                                  if (cre.toString() != "") {
                                    emailCont.clear();
                                    passCont.clear();
                                    Provider.of<Loader>(context, listen: false)
                                        .changeLoaderState();
                                    Navigator.of(context)
                                        .pushReplacementNamed(HomeScreen.id);
                                  }
                                } on FirebaseAuthException catch (e) {
                                  Provider.of<Loader>(context, listen: false)
                                      .changeLoaderState();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(e.code.toString())));
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: SizeConfig.defaultsize! + 10),
                                )
                              ],
                            )),
                        IntrinsicWidth(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
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
                          ),
                        ),
                        LoginMeathods()
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
