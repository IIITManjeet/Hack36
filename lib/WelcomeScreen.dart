import 'package:caress/HomeScreen.dart';
import 'package:caress/Instruction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserScreen.dart';
import 'main.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

late User loggedinUser;

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _auth = FirebaseAuth.instance;

  final db = FirebaseFirestore.instance;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController friendName = TextEditingController();
  TextEditingController friendContact = TextEditingController();
  TextEditingController friendPhone = TextEditingController();
  TextEditingController specialist = TextEditingController();
  TextEditingController specialistContact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill Your Basic Information'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.redAccent, Colors.blue])),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height / 20),
              Image(
                image: AssetImage('assets/brain4.png'),
                height: height / 4,
                width: 0.75 * width,
              ),
              TextFieldComponent(
                width: width,
                controller: name,
                hintText: "Enter your name",
                FieldName: "Name",
                type: TextInputType.text,
                necessaryField: true,
              ),
              TextFieldComponent(
                width: width,
                controller: age,
                hintText: "Enter your age",
                FieldName: "Age",
                type: TextInputType.number,
                necessaryField: true,
              ),
              TextFieldComponent(
                width: width,
                controller: friendName,
                hintText: "Enter your well wisher's name",
                FieldName: "Well Wisher's Name",
                type: TextInputType.text,
                necessaryField: true,
              ),
              TextFieldComponent(
                width: width,
                controller: friendContact,
                hintText: "Enter your Well wisher's Email",
                FieldName: "Email",
                type: TextInputType.emailAddress,
                necessaryField: true,
              ),
              TextFieldComponent(
                width: width,
                controller: friendPhone,
                hintText: "Enter your Well wisher's Contact No",
                FieldName: "Phone",
                type: TextInputType.phone,
                necessaryField: true,
              ),
              SizedBox(height: height / 20),
              Text(
                'If you have any history of mental/health related diagonasis,\nPlease fill the following',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),
              TextFieldComponent(
                width: width,
                controller: specialist,
                hintText: "Enter name of specialist/pyschologist",
                FieldName: "Name of specialist",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: specialistContact,
                hintText: "Enter email of specialist/pyschologist",
                FieldName: "Email of specialist",
                type: TextInputType.emailAddress,
                necessaryField: false,
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Read Instructions before proceeding!!!',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Instruction()));
                      },
                      child: Text(
                        'Instructions Page',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ))
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    width / 15, height / 30, width / 15, height / 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.8),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: MaterialButton(
                      elevation: 10.00,
                      minWidth: width / 1.2,
                      height: height / 11.5,
                      onPressed: () async {
                        if (name.text.isEmpty ||
                            age.text.isEmpty ||
                            friendName.text.isEmpty ||
                            friendContact.text.isEmpty ||
                            friendPhone.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Fill all the * necessary fields")));
                        } else if (!EmailValidator.validate(
                            friendContact.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Friends mail address is invalid!")));
                        } else if (!EmailValidator.validate(
                                specialistContact.text) &&
                            specialistContact.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Specialist mail address is invalid!")));
                        } else {
                          db
                              .collection("Users")
                              .doc("${patientInfo.email}")
                              .set(
                            {
                              'name': name.text,
                              'age': age.text,
                              'friend': friendName.text,
                              'friendContact': friendContact.text,
                              'friendPhone': friendPhone.text,
                              'specialist': specialist.text.isEmpty
                                  ? "null"
                                  : specialist.text,
                              'specialistContact':
                                  specialistContact.text.isEmpty
                                      ? "null"
                                      : specialistContact.text
                            },
                          );

                          patientInfo.name = name.text;
                          patientInfo.friendName = friendName.text;
                          patientInfo.friendContact = friendContact.text;
                          patientInfo.specialistName = specialist.text;
                          patientInfo.specialistContact =
                              specialistContact.text;
                          patientInfo.phoneNo = friendPhone.text;

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Data submitted")));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homescreen()));
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20.00),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent(
      {Key? key,
      required this.width,
      required this.controller,
      required this.hintText,
      required this.FieldName,
      required this.type,
      required this.necessaryField})
      : super(key: key);

  final double width;
  final TextEditingController controller;
  final String hintText;
  final String FieldName;
  final TextInputType type;
  final bool necessaryField;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: SizedBox(
        width: width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  FieldName,
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
                SizedBox(width: 5),
                necessaryField
                    ? Text('*',
                        style: TextStyle(fontSize: 15, color: Colors.red))
                    : SizedBox()
              ],
            ),
            TextField(
              keyboardType: type,
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
              ),
              autofocus: true,
              style: TextStyle(fontSize: 15, color: Colors.black),
              cursorColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
