//..................................................................................................
// Copyright (c)                                                                                   .
//                                                                                                 .
// Coded by : Alexandre BOLOT                                                                      .
//                                                                                                 .
// Last Modified : 1/29/19 6:24 PM	                                                               .
//                                                                                                 .
// Contact : bolotalex06@gmail.com                                                                 .
//..................................................................................................

import 'dart:math';

import 'package:flutter/material.dart';

/// This stateful widget is used as a custom CircularProgressIndicator
///
/// It's composed of 12 bubbles with decreasing radius, forming a circle
/// They simply turn in rounds until this widget is disposed.
///
/// You can force the 'disposing' of this widget by using :
/// ```dart
///
/// BubbleLoader loader = BubbleLoader();
///
/// loader.stopAnimation();
///
/// ```
///
/// This is useful, for example, when navigating to another view of the application
/// it avoids background use of 'SetState' causing warnings, errors, and efficiency loss
///
class BubbleLoader extends StatefulWidget {
  AnimationController controller;

  /// Forces the state to clean and dispose
  /// (not forcefully)
  void dispose() {
    if (controller?.isAnimating ?? false) {
      controller?.dispose();
    }
  }

  @override
  _BubbleLoaderState createState() => _BubbleLoaderState();
}

class _BubbleLoaderState extends State<BubbleLoader>
    with SingleTickerProviderStateMixin {
  Animation<double> rotation;

  /// Radius of the loader circle
  double radius = 30;

  @override
  void initState() {
    super.initState();

    // The complete circular animation lasts 2 seconds
    widget.controller = AnimationController(
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    rotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    widget.controller.addListener(() => setState(() {}));
    widget.controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: rotation,
      child: Stack(
        children: buildList(radius, Theme.of(context).primaryColor,),
      ),
    );
  }

  /// Allows the widget class to perform remote call to dispose
  /// See also: : [BubbleLoader.stopAnimation]
  void stopAnimation() => this.dispose();

  @override
  void dispose() {
    super.dispose();
  }

  /// Creates the list of 12 small bubbles
  ///
  /// * [radius] - Radius of the loader's circle raidus
  /// * [color] - Color of the bubbles
  ///
  List<Widget> buildList(double radius, Color color) {
    List<Widget> widgets = [];

    double amount = 12;

    for (double i = 0; i < amount - 1; i++) {
      widgets.add(Transform.translate(
        offset: Offset(
          radius * cos(2 * i * pi / amount),
          radius * sin(2 * i * pi / amount),
        ),
        child: _Dot(
          radius: log((10 * i) + 10) * 1.5,
          color: color,
        ),
      ));
    }

    return widgets;
  }
}

/// Simple stateless widget representing a colored circle on the screen.
///
class _Dot extends StatelessWidget {
  final double radius;
  final Color color;

  const _Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.radius,
      height: this.radius,
      decoration: BoxDecoration(
        color: this.color,
        shape: BoxShape.circle,
      ),
    );
  }
}
