import 'dart:convert';
import 'package:caress/ArticleFormat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  Client client = Client();
  List<Widget> articles = [];
  int f = 0;

  var date = DateFormat('yyyy-MM-dd').format(DateTime(
      DateTime.now().year, DateTime.now().month - 1, DateTime.now().day + 1));
  Future _retrieveArticles() async {
    Response response = await client.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=depression%20or%20anxiety%20or%20mental%20health&from=${date}&sortBy=publishedAt&apiKey=47764c0938d24be380f64d387a006bc3'));
    print(response.statusCode);
    var decodeddata = response.body;
    var data = jsonDecode(decodeddata);
    setState(() {
      f = 1;
    });
    return data;
  }

  void add() async {
    var finalData = await _retrieveArticles();
    for (int i = 0; i < 50; i++) {
      articles.add(
        Article(
            finalData['articles'][i]['author'],
            finalData['articles'][i]['description'],
            finalData['articles'][i]['url'],
            finalData['articles'][i]['urlToImage'],
            finalData['articles'][i]['title']),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    add();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
      ),
      body: Container(
        padding: EdgeInsets.all(15.00),
        child: SingleChildScrollView(
          child: f == 1
              ? Column(
                  children: articles,
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child:
                          CircularProgressIndicator(color: Colors.blueGrey))),
        ),
      ),
    );
  }
}
