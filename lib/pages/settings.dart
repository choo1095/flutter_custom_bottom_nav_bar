import 'package:flutter/material.dart';
import 'package:test_project/pages/menu.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SettingsSubPage())),
            child: Text("Settings main page"),
          ),
        ),
      ),
    );
  }
}

class SettingsSubPage extends StatefulWidget {
  @override
  _SettingsSubPageState createState() => _SettingsSubPageState();
}

class _SettingsSubPageState extends State<SettingsSubPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings sub Page'),
      ),
      body: Container(
        child: Center(
          child: 
            RaisedButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
      builder: (context) => MenuScreen(),
    )),
          child: Text("open menu page"),
        ),
      ),
    ));
  }
}
