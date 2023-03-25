import 'dart:ffi';

import 'package:caress/HomeScreen.dart';
import 'package:caress/IntroScreen.dart';
import 'package:caress/WelcomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserScreen.dart';

import 'Signup Screen.dart';
import 'UserScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Access());
  }
}

class Access extends StatefulWidget {
  @override
  State<Access> createState() => _AccessState();
}

class _AccessState extends State<Access> {
  bool userAvailable = false;
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    sharedPreferences = await SharedPreferences.getInstance();

    try {
      if (sharedPreferences.getString("caress101") != null) {
        setState(() {
          patientInfo.email = sharedPreferences.getString("caress101")!;
          userAvailable = true;
        });
      }
    } catch (e) {
      setState(() {
        userAvailable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return userAvailable ? Homescreen() : Intro();
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  Color color = Colors.black;
  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Caress'),
          centerTitle: true,
          backgroundColor: Colors.redAccent.withOpacity(0.8),
        ),
        body: Container(
          padding: EdgeInsets.all(width / 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/imagee.png'),
                  height: height / 4,
                  width: 0.75 * width,
                ),
                SizedBox(height: height / 25),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: width / 14),
                      child: Text(
                        'User Login',
                        style: TextStyle(
                          fontSize: 20.00,
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                // Login Text Field
                Container(
                  padding: EdgeInsets.all(width / 20),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: color,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      prefixIcon: Icon(Icons.perm_identity, color: color),
                      hintText: 'Enter your Email',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: color)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(width: 2, color: color)),
                    ),
                  ),
                ),

                // Password Text Field
                Container(
                  padding: EdgeInsets.fromLTRB(
                      width / 20, 0, width / 20, width / 20),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    cursorColor: color,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      prefixIcon: Icon(Icons.password, color: color),
                      hintText: 'Enter your Password',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: color)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(width: 2, color: color)),
                    ),
                  ),
                ),

                // Login Button
                Container(
                  padding: EdgeInsets.fromLTRB(
                      width / 20, height / 30, width / 20, height / 50),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.8),
                        borderRadius: BorderRadius.all(
                          Radius.circular(45.0),
                        )),
                    child: MaterialButton(
                        elevation: 10.00,
                        minWidth: width / 1.2,
                        height: height / 11.5,
                        onPressed: () async {
                          setState(() {
                            patientInfo.email = email;
                          });
                          if (email.isNotEmpty && password.isNotEmpty) {
                            if (password.length < 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Password must contain 6 letters')));
                            } else if (!EmailValidator.validate(email)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Email is not valid')));
                            } else {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString("caress101", email);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen()));
                            }
                          } else if (password.isEmpty || email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Fill both the values')));
                          }
                        },
                        child: Text(
                          'Login',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.00),
                        )),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          'Sign Up',
                          textScaleFactor: 1,
                          style: TextStyle(fontSize: 17, color: color),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class patientInfo {
  static String? name;
  static int? age;
  static String? email;
  static String? phoneNo;
  static String? friendName;
  static String? specialistName;
  static String? friendContact;
  static String? specialistContact;
  static String? profile_link;
}
