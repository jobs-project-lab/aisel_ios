import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('aisel'),
            backgroundColor: Colors.red,
            leading: IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                }),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.network(
                      "https://aisel-sy.com/assets/images/logo.png"),
                  margin: EdgeInsets.only(top: 300, bottom: 20),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp2()));
                    },
                    child: Text("Login using facebook"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
