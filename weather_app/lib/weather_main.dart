import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget rochesterText = Text(
      'Rochester',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );

    Widget newYorkUS = Text(
      'New York, US',
      style: TextStyle(
        color: Colors.grey[500],
      ),
    );

    Widget timePmText = Padding(
      padding: EdgeInsets.only(top: 16),
      child: Text(
        '6:00pm',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );

    Widget weatherSection = Padding(
      padding: EdgeInsets.only(right: 10, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Mostly Clear',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          Icon(
            Icons.cloud,
            color: Colors.grey,
            size: 48,
          ),
          Text(
            '41\u2109',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );

    /*Entire title section*/
    Widget locationWeatherSection = Container(
      padding: const EdgeInsets.only(left: 32, top: 8, right: 32, bottom: 32),
      child: Row(
        children: [
          /*Using an Expanded widget makes a child of a 
            Row or Column (also for Flex) expand to fill the 
            available space in the main axis*/
          Expanded(
            /*For location and Time*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rochesterText,
                newYorkUS,
                timePmText,
              ],
            ),
          ),
          weatherSection,
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.only(left: 32, top: 8, right: 32, bottom: 16),
      child: Text(
          'Today: Party cloudy currently. The high will be 81\u2109. Mostly clear tonight with a low of 63\u2109.'),
    );

    return MaterialApp(
      title: 'Flutter Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Tuesday November 10th'),
        ),
        body: ListView(
          children: [
            Image.asset(
              //https://unsplash.com/photos/4jjSan_VD8k
              'images/dayne-topkin-4jjSan_VD8k-unsplash.jpg',
              width: 600,
              height: 200,
              fit: BoxFit.cover,
            ),
            locationWeatherSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
