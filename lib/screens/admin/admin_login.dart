import 'package:cl1m_inventory/reusable_widgets/reusable_widget.dart';
import 'package:cl1m_inventory/screens/admin/admin_page.dart';
import 'package:cl1m_inventory/screens/borrower/borrower_page.dart';
import 'package:cl1m_inventory/screens/dashboard.dart';
import 'package:cl1m_inventory/screens/register_user.dart';
import 'package:cl1m_inventory/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("F48818"),
          hexStringToColor("F9CB9C"),
          hexStringToColor("FFB482")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                // logoWidget("assets/images/logo1.png"),
                // const SizedBox(
                //   height: 30,
                // ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                // forgetPassword(context),
                firebaseUIButton(context, "Sign In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminPage()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Color.fromARGB(179, 17, 17, 17))),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(
                color: Color.fromARGB(179, 17, 17, 17),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  // Widget forgetPassword(BuildContext context) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: 35,
  //     alignment: Alignment.bottomRight,
  //     child: TextButton(
  //       child: const Text(
  //         "Forgot Password?",
  //         style: TextStyle(color: Colors.white70),
  //         textAlign: TextAlign.right,
  //       ),
  //       onPressed: () => Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => ResetPassword())),
  //     ),
  //   );
  // }
}
