import 'package:flutter/material.dart';
import 'package:test_project/pages/menu.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> with AutomaticKeepAliveClientMixin {
  @override
  // implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page3'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PageThreeSub())),
          child: Text("page 3"),
        ),
        )));
  }
}

class PageThreeSub extends StatefulWidget {
  @override
  _PageThreeSubState createState() => _PageThreeSubState();
}

class _PageThreeSubState extends State<PageThreeSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PageThreeSubSub())),
          child: Text("page 3 sub"),
        ),
        )));
  }
}

class PageThreeSubSub extends StatefulWidget {
  @override
  _PageThreeSubSubState createState() => _PageThreeSubSubState();
}

class _PageThreeSubSubState extends State<PageThreeSubSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Three Sub Sub Page'),
      ),
      body: Container(
        child: Center(
          child: Text("Page three sub sub -- final"))));
  }
}