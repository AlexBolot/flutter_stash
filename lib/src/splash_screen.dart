//..................................................................................................
// Copyright (c)                                                                                   .
//                                                                                                 .
// Coded by : Alexandre BOLOT                                                                      .
//                                                                                                 .
// Last Modified : 6/17/19 4:23 AM	                                                                .
//                                                                                                 .
// Contact : bolotalex06@gmail.com                                                                 .
//..................................................................................................

import 'package:flutter/material.dart';
import 'package:flutter_stash/flutter_stash.dart';

class SplashScreen extends StatefulWidget {
  /// Use this for easier access from Named-Routes navigation
  static const String routeName = "/SplashScreen";

  /// Text displayed as title of this view (in the appbar)
  /// Default is empty string
  final String title;

  final String nextRouteName;
  final MaterialPageRoute nextRoute;

  final List<Function> loadFunctions;

  /// <br>
  /// Constructor of SplashScreen Page
  ///
  /// * [title] - Welcoming text displayed during loading time
  /// * [nextRouteName] - Used to navigate to the next page
  /// * [nextRoute] - Used to navigate to the next page
  /// * [loadFunctions] - List of functions to call before navigating to next page
  ///
  /// Note : if both [nextRouteName] and [nextRoute] are not null,
  /// [nextRouteName] will be used.
  ///
  const SplashScreen({
    this.title = '',
    this.nextRouteName = '',
    this.nextRoute,
    this.loadFunctions = const [],
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  /// Animated [BubbleLoader] used for user feedback
  /// during the duration of the actual data loading
  BubbleLoader loader = BubbleLoader();

  @override
  void initState() {
    super.initState();

    // Trigger async tasks in this method
    applicationLoading();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment(0, -1),
          children: <Widget>[
            Container(
              width: double.infinity,
              height: screenHeight * 2 / 5,
              child: Container(
                margin: EdgeInsets.all(0),
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: contrastOf(Theme.of(context).primaryColor),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight * 2 / 5),
              width: double.infinity,
              height: screenHeight * 3 / 5,
              child: Center(
                child: Container(
                  child: loader,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  applicationLoading() async {
    //Perform all tasks (usually async) here
    for (Function function in widget.loadFunctions) {
      await function();
    }

    // Stop the loader animation
    loader.dispose();

    // Navigate to the next page here
    if (widget.nextRouteName != null)
      Navigator.of(context).pushReplacementNamed(widget.nextRouteName);
    else if (widget.nextRoute != null)
      Navigator.of(context).push(widget.nextRoute);
    else
      throw 'Both [nextRouteName] and [nextRoute] are null !\n'
          'Unable to navigate out of ${this.runtimeType}';
  }
}
