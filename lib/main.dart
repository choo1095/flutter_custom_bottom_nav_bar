import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/home.dart';
import './pages/settings.dart';
import './pages/page3.dart';
import './pages/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      home: BottomNavigationBarController(),
    );
  }
}

class BottomNavigationBarController extends StatefulWidget {
  BottomNavigationBarController({Key key}) : super(key: key);

  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  // GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  TabController _tabController;
  List<Widget> mainTabs;
  List<BuildContext> navStack = [
    null,
    null,
    null
  ]; // one buildContext for each tab to store history  of navigation

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    mainTabs = <Widget>[
      Navigator(onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
          navStack[0] = context;
          return HomePage();
        });
      }),
      Navigator(onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
          navStack[1] = context;
          return SettingsPage();
        });
      }),
      Navigator(onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
          navStack[2] = context;
          return PageThree();
        });
      }),
    ];
    super.initState();
  }

  final List<BottomNavigationBarRootItem> bottomNavigationBarRootItems = [
    BottomNavigationBarRootItem(
      bottomNavigationBarItem: BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
    ),
    BottomNavigationBarRootItem(
      bottomNavigationBarItem: BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ),
    BottomNavigationBarRootItem(
      bottomNavigationBarItem: BottomNavigationBarItem(
        icon: Icon(Icons.access_alarms),
        label: 'Page 3',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: mainTabs,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavigationBarRootItems
              .map((e) => e.bottomNavigationBarItem)
              .toList(),
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
      onWillPop: () async {
        if (Navigator.of(navStack[_tabController.index]).canPop()) {
          Navigator.of(navStack[_tabController.index]).pop();
          setState(() {
            _selectedIndex = _tabController.index;
          });
          return false;
        } else {
          if (_tabController.index == 0) {
            setState(() {
              _selectedIndex = _tabController.index;
            });
            SystemChannels.platform
                .invokeMethod('SystemNavigator.pop'); // close the app
            return true;
          } else {
            _tabController.index =
                0; // back to first tap if current tab history stack is empty
            setState(() {
              _selectedIndex = _tabController.index;
            });
            return false;
          }
        }
      },
    );
  }

  void _onItemTapped(int index) {
    _tabController.index = index;
    setState(() => _selectedIndex = index);
  }
}

class BottomNavigationBarRootItem {
  final String routeName;
  // final NestedNavigator nestedNavigator;
  final BottomNavigationBarItem bottomNavigationBarItem;

  BottomNavigationBarRootItem({
    @required this.routeName,
    // @required this.nestedNavigator,
    @required this.bottomNavigationBarItem,
  });
}

// abstract class NestedNavigator extends StatelessWidget {
//   final GlobalKey<NavigatorState> navigatorKey;

//   NestedNavigator({Key key, @required this.navigatorKey}) : super(key: key);
// }

// class HomeNavigator extends NestedNavigator {
//   HomeNavigator({Key key, @required GlobalKey<NavigatorState> navigatorKey})
//       : super(
//           key: key,
//           navigatorKey: navigatorKey,
//         );

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: navigatorKey,
//       onGenerateRoute: (RouteSettings settings) {
//         WidgetBuilder builder;
//         // switch (settings.name) {
//         //   case '/home':
//         //     builder = (BuildContext context) => HomePage();
//         //     break;
//         //   default:
//         //     throw Exception('Invalid route: ${settings.name}');
//         // }
//         return MaterialPageRoute(
//           builder: builder,
//           settings: settings,
//         );
//       },
//     );
//   }
// }
