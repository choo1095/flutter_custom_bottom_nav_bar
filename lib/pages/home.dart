import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeSubPage())),
          child: Text('Open Sub-Page'),
        ),
      ),
    );
  }
}

class HomeSubPage extends StatefulWidget {
  const HomeSubPage({Key key}) : super(key: key);

  @override
  _HomeSubPageState createState() => _HomeSubPageState();
}

class _HomeSubPageState extends State<HomeSubPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // implement wantKeepAlive
  bool get wantKeepAlive => true;

  String _text;

  @override
  void initState() {
    _text = 'Click me';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Sub Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeSubSubPage())),
          child: Text(_text),
        ),
      ),
    );
  }
}

class HomeSubSubPage extends StatefulWidget {
  HomeSubSubPage({Key key}) : super(key: key);

  @override
  _HomeSubSubPageState createState() => _HomeSubSubPageState();
}

class _HomeSubSubPageState extends State<HomeSubSubPage> with AutomaticKeepAliveClientMixin {
  @override
  // implement wantKeepAlive
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('hehe'),
        ),
        body: Container(child: Center(child: Text("hehehehehehehehehehe"))));
  }
}
