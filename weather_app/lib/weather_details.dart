import 'package:flutter/material.dart';
import 'DataModels/CurrentWeatherCall.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



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



void main() {
  runApp(WeatherDetails(
    data: "Rochester",
  ));
}

class WeatherDetails extends StatelessWidget {
  final String data;
  WeatherDetails({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CurrentWeather currentWeather;
    Future<CurrentWeather> futureOneCallWeather;
    FutureBuilder<CurrentWeather>(
            future: futureOneCallWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
          currentWeather = snapshot.data;
           } else if (snapshot.hasError) {
          currentWeather = null;
           }

        // By default, show a loading spinner.
          return CircularProgressIndicator();
            },
          );
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
      child:

      

    );

    return MaterialApp(
      title: 'Flutter Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
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
                "Sunday, Nov. 22nd",
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
        ),
      ),
    );
  }
}
