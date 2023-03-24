import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Article extends StatelessWidget {
  Article(this.author, this.description, this.url, this.imageUrl, this.title);
  final String? author;
  final String description;
  final String url;
  final String? imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
      padding: EdgeInsets.all(10.00),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Icon(
                  Icons.article,
                  size: 50,
                  color: Colors.black,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Color(0xFF02315E),
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 60),
            Container(
              child: imageUrl == null
                  ? SizedBox()
                  : Image(
                      image: NetworkImage(imageUrl!),
                    ),
            ),
            SizedBox(height: height / 60),
            author == null
                ? SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Text('- by ${author}')),
                    ],
                  ),
            SizedBox(height: height / 30),
            Container(
                padding: EdgeInsets.all(25.00),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black)),
                child: Text(
                  description,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                )),
            TextButton(
              onPressed: () {
                launch(url);
              },
              child: Text(
                'click on this link to know more',
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: height / 60,
              child: Divider(
                color: Colors.black,
                thickness: 3.00,
              ),
            )
          ],
        ),
      ),
    );
  }
}
