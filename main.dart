import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(title: "navigation", home: homePage()));

class homePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("home Page")
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget> [
            ListTile(title: Text("North America tapable  "),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext) => NorthAmerica()));
              },
            ),
            ListTile(title: Text("North America 2"),
            ),
            ListTile(title: Text("North America 3"),
            ),
            ListTile(title: Text("North America 4"),
            ),
          ],
        )

      ),
    );
  }
}
class NorthAmerica extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("North America"),
      ),
      body: Center(
        child: new Column(
          children: [
            new Container(
              child: Text('Welcome to the Africa page'),
            ),
            new Container(
              child: Image(
                image: AssetImage("images/na.jpg"),
              ),
            ),

          ],
        ),
        //child: Text('Welcome to the Africa page'),
      ),
    );
  }
}