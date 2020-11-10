import 'package:flutter/material.dart';
import 'my_flutter_app_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*Entire title section*/
    Widget locationWeatherSection = Container(
      padding: const EdgeInsets.only(left: 32, top: 16, right: 32, bottom: 32),
      child: Row(
        children: [
          /*Using an Expanded widget makes a child of a 
            Row or Column (also for Flex) expand to fill the 
            available space in the main axis*/
          Expanded(
            /*For location*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*top, main location*/
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 2),
                  child: Text(
                    'Rochester',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                /*below, more specific location*/
                Text(
                  'New York, US',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    '6:00pm',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //https://icon-library.com/icon/mostly-cloudy-icon-4.html
          Padding(
            padding: EdgeInsets.only(right: 12, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    'Mostly Clear',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                Icon(
                  MyFlutterApp.mostly_cloudy_icon_4,
                  color: Colors.black,
                  size: 48,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: Text(
                    '41\u2109',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
              //https://www.rochester.edu/
              'images/2018-09-28_aerial_photo_407.jpg',
              width: 600,
              height: 240,
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
