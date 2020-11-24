import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DataModels/CurrentWeatherCall.dart';

Future<CurrentWeather> fetchWeather() async {
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

void main() => runApp(WeatherCall());

class WeatherCall extends StatefulWidget {
  WeatherCall({Key key}) : super(key: key);

  @override
  _WeatherCallState createState() => _WeatherCallState();
}

class _WeatherCallState extends State<WeatherCall> {
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
          title: Text('Weather App'),
        ),
        body: Center(
          child: FutureBuilder<CurrentWeather>(
            future: futureCurrentWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BodyWidget(
                  currentWeather: snapshot.data,
                  //isImperial: true,
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
      setSharedPrefs();
    });
  }

  void _setImperialFalse() {
    setState(() {
      _isImperial = false;
      setSharedPrefs();
    });
  }

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isImperial = prefs.getBool("isImperial") ?? true;
    print("shared: " + _isImperial.toString());
    if (!_isImperial) {
      _setImperialFalse();
    }
  }

  Future<Null> setSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isImperial", _isImperial);
    print("shared: " + _isImperial.toString());
  }

  @override
  initState() {
    super.initState();
    getSharedPrefs();
  }

  _BodyWidgetState(this.currentWeather);

  @override
  Widget build(BuildContext context) {
    currentWeather = widget.currentWeather;
    print(_isImperial);

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
          Image.network(currentWeather.weather.weatherList[0].iconUrl()),
          Text(
            currentWeather.main.tempString(_isImperial).toString(),
            //'hi',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),

          //temp text todo remove
          Text(currentWeather.lastUpdated()),
          Text(currentWeather.main.pressureString(_isImperial)),
          Text(currentWeather.wind.speedString(_isImperial)),
          Text(currentWeather.wind.degDirectionString()),
          Text(currentWeather.clouds.cloudsString()),
          Text(currentWeather.sys.sunriseDate()),
          Text(currentWeather.sys.sunsetDate()),
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
          widget.currentWeather.main.temp.toString() +
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
        Row(
          children: [
            FlatButton(onPressed: _setImperialTrue, child: Text('imperial')),
            FlatButton(onPressed: _setImperialFalse, child: Text('metric'))
          ],
        )
      ],
    );
  }
}

class SharedPreferencesHelper {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final String _isImperial = "isImperial";

  /// ------------------------------------------------------------
  /// Method that returns the user language code, 'en' if not set
  /// ------------------------------------------------------------
  static Future<bool> getIsImperial() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_isImperial) ?? true;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user language code
  /// ----------------------------------------------------------
  static Future<bool> setIsImperial(bool isImperial) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_isImperial, isImperial);
  }
}
