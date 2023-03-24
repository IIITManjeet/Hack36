import 'package:caress/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email;
  late String password;
  TextEditingController e = TextEditingController();
  TextEditingController p = TextEditingController();
  Color color = Colors.black;
  final _auth = FirebaseAuth.instance;

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
                        'SignUp',
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
                    controller: e,
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
                    controller: p,
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
                          if (password.isNotEmpty && email.isNotEmpty) {
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
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              e.clear();
                              p.clear();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Signing up was successful')));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Loading()));
                            }
                          } else if (password.isEmpty || email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Fill both the values')));
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.00),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  callme() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    callme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: CircularProgressIndicator(color: Colors.red),
        ),
      ),
    );
  }
}
