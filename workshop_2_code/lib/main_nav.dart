import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: 'Navigation', home: homePage()));

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      drawer: new Drawer(),
    );
  }
}

class homePageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      drawer: new Drawer(
          child: ListView(children: <Widget>[
        ListTile(
          title: Text('North America'),
        ),
        ListTile(
          title: Text('South America'),
        ),
        ListTile(
          title: Text('Europe'),
        ),
        ListTile(
          title: Text('Australia'),
        ),
        ListTile(
          title: Text('Asia'),
        ),
        ListTile(
          title: Text('Africa'),
        ),
        ListTile(
          title: Text('Antarctica'),
        )
      ])),
    );
  }
}

class homePageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      drawer: new Drawer(
          child: ListView(children: <Widget>[
        ListTile(
            title: Text('North America'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => NorthAmerica()));
            }),
        ListTile(
            title: Text('South America'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => SouthAmerica()));
            }),
        ListTile(
            title: Text('Europe'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => Europe()));
            }),
        ListTile(
            title: Text('Australia'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => Australia()));
            }),
        ListTile(
            title: Text('Asia'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => Asia()));
            }),
        ListTile(
            title: Text('Africa'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => Africa()));
            }),
        ListTile(
            title: Text('Antarctica'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => Antarctica()));
            })
      ])),
    );
  }
}

class NorthAmerica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("North America"),
      ),
      body: Center(
        child: Text('Welcome to the North America Page'),
      ),
    );
  }
}

class SouthAmerica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("South America"),
      ),
      body: Center(
        child: Text('Welcome to the South America Page'),
      ),
    );
  }
}

class Europe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Europe"),
      ),
      body: Center(
        child: Text('Welcome to the Europe page'),
      ),
    );
  }
}

class Asia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asia"),
      ),
      body: Center(
        child: Text('Welcome to the Asia page'),
      ),
    );
  }
}

class Africa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Africa"),
      ),
      body: Center(
        child: Text('Welcome to the Africa page'),
      ),
    );
  }
}

class Australia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Australia"),
      ),
      body: Center(
        child: Text('Welcome to the Australia Page'),
      ),
    );
  }
}

class Antarctica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Antarctica"),
      ),
      body: Center(
        child: Text('Antarctica'),
      ),
    );
  }
}
