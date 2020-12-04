import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'models/CurrentWeatherCall.dart';

Future<CurrentWeather> fetchWeather() async {
  final response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?q=Harrison,mi,us&APPID=d79179cc0d90b45eb7725a8eacc0ec8c');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CurrentWeather.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 404) {
    throw Exception('City not found');
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
  Future<CurrentWeather> futureCurrentWeather;

  @override
  void initState() {
    super.initState();
    futureCurrentWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather API Calls example'),
        ),
        body: Center(
          child: FutureBuilder<CurrentWeather>(
            future: futureCurrentWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BodyWidget(
                  currentWeather: snapshot.data,
                );
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

class BodyWidget extends StatefulWidget {
  final CurrentWeather currentWeather;
  //final bool isImperial; // false not imperial (metric)
  // true is imperial
  BodyWidget({Key key, @required this.currentWeather}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState(currentWeather);
}

class _BodyWidgetState extends State<BodyWidget> {
  CurrentWeather currentWeather;
  bool _isImperial = true;

  void _setImperialTrue() {
    setState(() {
      _isImperial = true;
    });
  }

  void _setImperialFalse() {
    setState(() {
      _isImperial = false;
    });
  }

  _BodyWidgetState(this.currentWeather);

  @override
  Widget build(BuildContext context) {
    currentWeather = widget.currentWeather;
    //print(_isImperial);

    return ListView(
      padding: const EdgeInsets.only(top: 50),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text("City: "),
                Text("Country: "),
                Text("Last Updated: "),
                SizedBox(height: 30),
                Text("Temperature: "),
                Text("High: "),
                Text("Low: "),
                Text("Feels Like: "),
                SizedBox(height: 30),
                Text("Latitude: "),
                Text("Longitude: "),
                SizedBox(height: 30),
                Text("Sunrise: "),
                Text("Sunset: "),
                Text("One Hour Rain: "),
                Text("Three Hour Rain: "),
                Text("Pressure: "),
                Text("Wind Speed: "),
                Text("Wind Direction: "),
                Text("Cloudiness: "),
                Text("Humidity: "),
                Text("Visibility: "),
              ],
            ),
            Column(
              children: [
                Text(currentWeather.name),
                Text(currentWeather.sys.country),
                Text(currentWeather.lastUpdated()),
                SizedBox(height: 30),
                Text(currentWeather.main.tempString(_isImperial)),
                Text(currentWeather.main.tempMaxString(_isImperial)),
                Text(currentWeather.main.tempMinString(_isImperial)),
                Text(currentWeather.main.feelsLikeString(_isImperial)),
                SizedBox(height: 30),
                Text(currentWeather.coord.lat.toString()),
                Text(currentWeather.coord.lon.toString()),
                SizedBox(height: 30),
                Text(currentWeather.sys.sunriseDate()),
                Text(currentWeather.sys.sunsetDate()),
                Text(currentWeather.rain != null
                    ? currentWeather.rain.oneHourString(_isImperial)
                    : "n/a"),
                Text(currentWeather.rain != null
                    ? currentWeather.rain.threeHourString(_isImperial)
                    : "n/a"),
                Text(currentWeather.main.pressureString(_isImperial)),
                Text(currentWeather.wind.speedString(_isImperial)),
                Text(currentWeather.wind.degDirectionString()),
                Text(currentWeather.clouds.cloudsString()),
                Text(currentWeather.main.humidityString()),
                Text(currentWeather.visibilityString(_isImperial)),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(onPressed: _setImperialTrue, child: Text('imperial')),
            FlatButton(onPressed: _setImperialFalse, child: Text('metric'))
          ],
        )
      ],
    );
  }
}
