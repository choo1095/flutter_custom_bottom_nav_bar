import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Page'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MenuSubPage())),
          child: Text("open menu subpage!!!"),
        ),
        )));
  }
}

class MenuSubPage extends StatefulWidget {
  @override
  _MenuSubPageState createState() => _MenuSubPageState();
}

class _MenuSubPageState extends State<MenuSubPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu subpage'),
      ),
      body: Container(
        child: Center(
          child: Text("end"),
        )));
  }
  
}