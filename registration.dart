import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String user_email = "";
  String user_password = "";
  final _auth = FirebaseAuth.instance;
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }

    try {
      // if (_login) {
      // UserCredential authResult = await _auth.signInWithEmailAndPassword(
      //     email: user_email, password: user_password);
      // print(authResult);
      // Navigator.pushNamed(context, '/home');
      // } else {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user_email,
        password: user_password,
      );
      _showSnackBar("User has been created!");
      // }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showSnackBar('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _showSnackBar('Wrong password provided for that user.');
      } else {
        _showSnackBar(e.message!);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('D:\flutter_exp2_vs\project\lib\login.png'),
      //       fit: BoxFit.cover),
      // ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 90),
              child: Text(
                'Google Keep Notes',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6), fontSize: 25),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 35, top: 290),
              child: Text(
                'Registration',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.9), fontSize: 29),
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                user_email = value!;
                                user_email = user_email.trim();
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                user_password = value!;
                                user_password = user_password.trim();
                              },
                              style: TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: _trySubmit,
                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: Text(
                                    'Login',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18),
                                  ),
                                  style: ButtonStyle(),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
