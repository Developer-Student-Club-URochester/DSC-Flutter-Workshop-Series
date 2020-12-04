import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DataModels/CurrentWeatherCall.dart';

Future<CurrentWeather> fetchWeather(
  String city,
  String stateCode,
  String countryCode,
) async {
  final response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?q=' +
          city +
          ',' +
          stateCode +
          ',' +
          countryCode +
          '&APPID=d79179cc0d90b45eb7725a8eacc0ec8c');

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

void main() => runApp(WeatherDetails(
      city: "Rochester",
      stateCode: "ny",
      countryCode: "us",
    ));

class WeatherDetails extends StatefulWidget {
  final String city;
  final String stateCode;
  final String countryCode;

  WeatherDetails({
    Key key,
    @required this.city,
    this.stateCode,
    this.countryCode,
  }) : super(key: key);

  @override
  _WeatherDetailsState createState() =>
      _WeatherDetailsState(city, stateCode, countryCode);
}

class _WeatherDetailsState extends State<WeatherDetails> {
  Future<CurrentWeather> futureCurrentWeather;
  String city;
  String stateCode;
  String countryCode;

  @override
  void initState() {
    super.initState();
    futureCurrentWeather = fetchWeather(city, stateCode, countryCode);
  }

  _WeatherDetailsState(this.city, this.stateCode, this.countryCode);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(city.toUpperCase()),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Center(
          child: FutureBuilder<CurrentWeather>(
            future: futureCurrentWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BodyWidget(
                  currentWeather: snapshot.data,
                  city: city,
                  stateCode: stateCode,
                  countryCode: countryCode,
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
  final String city;
  final String stateCode;
  final String countryCode;

  //final bool isImperial; // false not imperial (metric)
  // true is imperial
  BodyWidget(
      {Key key,
      @required this.currentWeather,
      this.city,
      this.stateCode,
      this.countryCode})
      : super(key: key);

  @override
  _BodyWidgetState createState() =>
      _BodyWidgetState(currentWeather, city, stateCode, countryCode);
}

class _BodyWidgetState extends State<BodyWidget> {
  CurrentWeather currentWeather;
  String city;
  String stateCode;
  String countryCode;

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

  _BodyWidgetState(
      this.currentWeather, this.city, this.stateCode, this.countryCode);

  @override
  Widget build(BuildContext context) {
    currentWeather = widget.currentWeather;
    //print(_isImperial);

    return ListView(
      padding: const EdgeInsets.only(top: 25, bottom: 50),
      children: [
        Container(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              Text(
                currentWeather.name +
                    (widget.stateCode == ""
                        ? ""
                        : " " + widget.stateCode.toUpperCase()) +
                    ", " +
                    currentWeather.sys.country,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    currentWeather.weather.weatherList[0].iconUrl(),
                  ),
                  SizedBox(width: 10),
                  Text(
                    currentWeather.main.tempString(_isImperial),
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text("Last Updated: " + currentWeather.lastUpdated()),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("City: "),
                  Text("Country: "),
                  Text("Latitude: "),
                  Text("Longitude: "),
                  SizedBox(height: 20),
                  Text("Temperature: "),
                  Text("High: "),
                  Text("Low: "),
                  Text("Feels Like: "),
                  SizedBox(height: 20),
                  Text("Sunrise: "),
                  Text("Sunset: "),
                  SizedBox(height: 20),
                  Text("One Hour Rain: "),
                  Text("Three Hour Rain: "),
                  SizedBox(height: 20),
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
                  Text(currentWeather.coord.lat.toString()),
                  Text(currentWeather.coord.lon.toString()),
                  SizedBox(height: 20),
                  Text(currentWeather.main.tempString(_isImperial)),
                  Text(currentWeather.main.tempMaxString(_isImperial)),
                  Text(currentWeather.main.tempMinString(_isImperial)),
                  Text(currentWeather.main.feelsLikeString(_isImperial)),
                  SizedBox(height: 20),
                  Text(currentWeather.sys.sunriseDate()),
                  Text(currentWeather.sys.sunsetDate()),
                  SizedBox(height: 20),
                  Text(currentWeather.rain != null
                      ? currentWeather.rain.oneHourString(_isImperial)
                      : "n/a"),
                  Text(currentWeather.rain != null
                      ? currentWeather.rain.threeHourString(_isImperial)
                      : "n/a"),
                  SizedBox(height: 20),
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
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                onPressed: _setImperialTrue,
                child: Text(
                  'imperial',
                  style: TextStyle(fontSize: 16),
                )),
            FlatButton(
                onPressed: _setImperialFalse,
                child: Text(
                  'metric',
                  style: TextStyle(fontSize: 16),
                ))
          ],
        ),
      ],
    );
  }
}
