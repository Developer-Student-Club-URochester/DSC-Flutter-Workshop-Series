import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'DataModels/CurrentWeatherCall.dart';

Future<CurrentWeather> fetchOneCallWeather() async {
  final response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?q=Rochester,us&APPID=d79179cc0d90b45eb7725a8eacc0ec8c');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CurrentWeather.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load weather');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<CurrentWeather> futureOneCallWeather;

  @override
  void initState() {
    super.initState();
    futureOneCallWeather = fetchOneCallWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<CurrentWeather>(
            future: futureOneCallWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BodyWidget(currentWeather: snapshot.data); // todo
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  final CurrentWeather currentWeather;
  BodyWidget({
    Key key,
    @required this.currentWeather,
  });

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
      child: Text('Today: Party cloudy currently. The high will be' +
          currentWeather.main.temp.toString() +
          ' \u2109. Mostly clear tonight with a low of 63\u2109.'),
    );
    return ListView(
      children: [
        Image.asset(
          //https://unsplash.com/photos/4jjSan_VD8k
          'images/dayne-topkin-4jjSan_VD8k-unsplash.jpg',
          width: 600,
          height: 200,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 12),
          alignment: Alignment.centerLeft,
          child: Text(
            "Tuesday, Nov. 10th",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue[500],
            ),
          ),
        ),
        locationWeatherSection,
        textSection,
      ],
    );
  }
}
