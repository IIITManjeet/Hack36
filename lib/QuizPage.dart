import 'dart:convert';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:http/http.dart' as http;

class QuizPage extends StatefulWidget {
  QuizPage(this.question, this.x, this.disorder, this.colors);
  List<String> question;
  final String disorder;
  final int x;
  final List<Color> colors;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child:
            Question(widget.question, widget.x, widget.disorder, widget.colors),
      ),
    );
  }
}

class Question extends StatefulWidget {
  Question(this.question, this.qno, this.disorder, this.colors);
  final List<String> question;
  final int qno;
  final String disorder;
  final List<Color> colors;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int i = 0;
  bool over = false;
  int ans = 0;

  Future sendEmail(
      String name1, String name2, String message, String email) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_vc1tc92';
    const templateId = 'template_mak408l';
    const userId = 'C7ns8WoNqX9Ns9GvG';
    try {
      final response = await http.post(url,
          headers: {
            'origin': 'http:localhost',
            'Content-Type': 'application/json'
          },
          body: json.encode({
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': userId,
            'template_params': {
              'from_name': name1,
              'to_name': name2,
              'message': message,
              'to_email': email,
            }
          }));
      return response.statusCode;
    } catch (e) {
      print("feedback email response");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: height / 2.5,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.colors),
              ),
              child: Padding(
                child: Text(
                  over == false ? 'Questionaire' : 'Results',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 90),
              ),
            ),
            Positioned(
              top: height / 5.5,
              child: Container(
                height: height * 0.5,
                width: width / 1.2,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blueGrey, width: 2),
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        over == false
                            ? 'Question no - ${i + 1}'
                            : '------ Conclusion ------',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: height / 30),
                      Text(
                        over == false
                            ? widget.question[i]
                            : ans == widget.qno
                                ? "you are having chances of suffering through ${widget.disorder}"
                                : ans >= widget.qno / 2
                                    ? "You have moderate chances of suffering through ${widget.disorder}"
                                    : "You have very low chances of suffering through ${widget.disorder}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      over == true
                          ? Container(
                              child: CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 13.0,
                                animation: true,
                                animationDuration: 600,
                                percent: ans == widget.qno
                                    ? 0.9
                                    : ans >= widget.qno / 2
                                        ? 0.6
                                        : 0.3,
                                center: new Text(
                                  ans == widget.qno
                                      ? "High Risk"
                                      : ans >= widget.qno / 2
                                          ? "Moderate Risk"
                                          : "Low Risk",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: ans == widget.qno
                                    ? Colors.red
                                    : ans >= widget.qno / 2
                                        ? Colors.orange
                                        : Colors.green,
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 0.35 * height),
        over == false
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 0.36 * width,
                    height: 0.08 * height,
                    child: ElevatedButton(
                      onPressed: () {
                        ans++;
                        setState(() {
                          i++;
                          if (i > widget.qno - 1) {
                            over = true;
                            String risk = ans == widget.qno
                                ? "High"
                                : ans >= widget.qno / 2
                                    ? "Moderate"
                                    : "Low";
                            print(patientInfo.specialistContact);
                            sendEmail(
                                patientInfo.name!,
                                patientInfo.specialistName!,
                                'Your patient has taken an ${widget.disorder} test. He/she has ${risk} risk of suffering through the disorder. Kindly share your advice on ${patientInfo.email} or contact him personally',
                                patientInfo.specialistContact!);
                          }
                        });
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            widget.colors[0].withOpacity(0.7)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.36 * width,
                    height: 0.08 * height,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          i++;
                          if (i > widget.qno - 1) {
                            over = true;
                          }
                        });
                      },
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            widget.colors[1].withOpacity(0.8)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : ans == widget.qno
                ? Text(
                    'Please focus on yourself and give your self some time to meditate and relax;',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                : ans >= widget.qno / 2
                    ? Text(
                        'Keep meditating regularly and eat healthy.\nYou are just few days away from perfect mental health',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'Your health seems good enough.\nKeep it up!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
      ],
    );
  }
}
