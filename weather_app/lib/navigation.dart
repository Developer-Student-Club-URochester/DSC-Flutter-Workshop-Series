import 'package:flutter/material.dart';
import 'weather_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      home: HomeSearchScreen(),
    );
  }
}

class HomeSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget todayWeatherHighLow = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('high: '),
            Text('20'),
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('low: '),
            Text('10'),
          ],
        ),
      ],
    );
    Widget todaWeatherRow = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.cloud,
          color: Colors.grey,
          size: 64,
        ),
        SizedBox(width: 24),
        Text(
          '14\u2109',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: todayWeatherHighLow,
        ),
      ],
    );

    Widget todayWeatherSection = Container(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 32, bottom: 16),
      child: todaWeatherRow,
    );
    Widget weatherWidget = Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Rochester',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'description',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[500],
            ),
          ),
          todayWeatherSection,
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 32, top: 8, right: 32, bottom: 16),
            child: TextField(
              decoration: InputDecoration(labelText: 'Search Location'),
            ),
          ),
          weatherWidget,
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return WeatherDetails(city: 'Rochester');
                    },
                  ),
                );
              },
              child: Text(
                'details',
                style: TextStyle(fontSize: 16),
              )),
        ],
      ),
    );
  }
}
