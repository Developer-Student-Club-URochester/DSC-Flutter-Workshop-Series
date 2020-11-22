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
                return ListView
                 // todo
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
    return Stack(
      children: <Widget>[
        // ...
      ],
    );
  }
}