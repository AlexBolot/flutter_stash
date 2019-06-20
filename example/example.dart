import 'package:flutter/material.dart';
import 'package:flutter_stash/flutter_stash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String applicationName = 'Money Tracker';

    buildSplashScreen() => SplashScreen(
          title: applicationName,
          nextRouteName: HomePage.routeName,
          loadFunctions: [
            () => print('hey there, I reached the SplashScreen'),
            // wait to simulate real async call
            () async => await Future.delayed(Duration(seconds: 5)),
            () => print("hey there, I'me leaving the SplashScreen"),
          ],
          nextRoute: MaterialPageRoute(builder: (context) => HomePage()),
        );

    return MaterialApp(
      title: applicationName,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => buildSplashScreen(),
        SplashScreen.routeName: (context) => buildSplashScreen(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  /// Use this for easier access from Named-Routes navigation
  static const String routeName = "/HomePage";

  /// Text displayed as title of this view (in the appbar)
  /// Default is empty string
  final String title;

  const HomePage({this.title = 'HomePage'});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        child: Center(
          child: TooltipText(
            text: widget.title,
            tooltip: 'This is a tooltip',
          ),
        ),
      ),
    );
  }
}
