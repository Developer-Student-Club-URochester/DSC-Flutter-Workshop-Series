import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      home: Scaffold(
        appBar: AppBar(title: Text("ListView Practice")),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListViewFive(context);
  }
}

Widget _myListView(BuildContext context) {
  //static listview
  return ListView(children: <Widget>[
    Text('North America'),
    Text('South America'),
    Text('Europe'),
    Text('Asia'),
    Text('Africa'),
    Text('Australia'),
    Text('Antarctica')
  ]);
}

Widget _myListViewTwo(BuildContext context) {
  //dynamic listview
  final countries = ['Afghanistan', 'Armenia', 'Azerbaijan'];
  return ListView.builder(
    itemCount: countries.length,
    itemBuilder: (context, index) {
      return (Text(countries[index]));
    },
  );
}

Widget _myListViewThree(BuildContext context) {
  //dynamic listview with list tiles
  final countries = [
    'Afghanistan',
    'Armenia',
    'Azerbaijan',
    'Angola',
    'South Korea',
    'China',
    'Japan',
    'Philippines',
    'Papau New Guinea',
    'Bahamas',
    'Colombia'
  ];
  return ListView.builder(
    itemCount: countries.length,
    itemBuilder: (context, index) {
      return (ListTile(title: Text(countries[index])));
    },
  );
}

Widget _myListViewFour(BuildContext context) {
  // listview tiles with dividers
  final countries = [
    'Afghanistan',
    'Armenia',
    'Azerbaijan',
    'Angola',
    'South Korea',
    'China',
    'Japan',
    'Philippines',
    'Papau New Guinea',
    'Bahamas',
    'Colombia'
  ];
  return ListView.separated(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(countries[index]));
      },
      separatorBuilder: (context, index) {
        return Divider();
      });
}

Widget _myListViewFive(BuildContext context) {
  // listview tiles with dividers
  final countries = [
    'Afghanistan',
    'Armenia',
    'Azerbaijan',
    'Angola',
    'South Korea',
    'China',
    'Japan',
    'Philippines',
    'Papau New Guinea',
    'Bahamas',
    'Colombia'
  ];
  return ListView.builder(
    itemCount: countries.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(title: Text(countries[index])),
      );
    },
  );
}
