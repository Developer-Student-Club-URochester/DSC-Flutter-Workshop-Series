import 'package:flutter/material.dart';
import 'weather_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: ListView(
        children: [
          MyCustomForm(),
        ],
      ),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final city = TextEditingController();
  final stateCode = TextEditingController();
  final countryCode = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    city.dispose();
    stateCode.dispose();
    countryCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 32, top: 8, right: 32, bottom: 16),
          child: TextField(
            decoration: InputDecoration(labelText: 'Search City'),
            controller: city,
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 32, top: 8, right: 32, bottom: 16),
          child: TextField(
            decoration: InputDecoration(labelText: 'state code (ex: ny)'),
            controller: stateCode,
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 32, top: 8, right: 32, bottom: 16),
          child: TextField(
            decoration: InputDecoration(labelText: 'country code (ex: us)'),
            controller: countryCode,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return WeatherDetails(
                    city: city.text,
                    stateCode: stateCode.text,
                    countryCode: countryCode.text,
                  );
                },
              ),
            );
          },
          child: Text(
            'Find Weather',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
