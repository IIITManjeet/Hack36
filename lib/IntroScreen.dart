import 'package:caress/main.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final List<Introduction> list = [
    Introduction(
      title: 'Care Taker',
      subTitle: 'Keeps an eye on your vital details 24 X 7',
      imageUrl: 'assets/care.jpg',
      titleTextStyle: tstyle,
      subTitleTextStyle: ststyle,
    ),
    Introduction(
      title: 'Accurate results',
      subTitle:
          'Tries its best to deliver the best functionality for accessing mental health',
      imageUrl: 'assets/imagee.png',
      titleTextStyle: tstyle,
      subTitleTextStyle: ststyle,
    ),
    Introduction(
      title: 'Always on alert',
      subTitle: 'Can send automatic emails and start calls on a tap',
      imageUrl: 'assets/message.gif',
      titleTextStyle: tstyle,
      subTitleTextStyle: ststyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreenOnboarding(
        backgroudColor: Colors.white,
        foregroundColor: Color(0xFF0165ff),
        introductionList: list,
        onTapSkipButton: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ), //MaterialPageRoute
          );
        },
        // foregroundColor: Colors.red,
      ),
    );
  }
}

const tstyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
const ststyle = TextStyle(
    fontWeight: FontWeight.normal, fontSize: 18, fontStyle: FontStyle.italic);
