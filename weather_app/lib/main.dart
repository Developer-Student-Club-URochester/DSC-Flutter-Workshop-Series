import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget textSection = Container(
      padding: const EdgeInsets.only(left: 32, top: 8, right: 32, bottom: 16),
      child: Text(
          'Today: Party cloudy currently. The high will be 81\u2109. Mostly clear tonight with a low of 63\u2109.'),
    );
    return MaterialApp(
      title: 'Title of Application',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Displayed Title'),
        ),
        body: Column(
          children: [
            Image.asset(
              //https://unsplash.com/photos/4jjSan_VD8k
              'images/dayne-topkin-4jjSan_VD8k-unsplash.jpg',
              width: 600,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                'Rochester',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'New York, US',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            textSection,
          ],
        ),
      ),
    );
  }
}
