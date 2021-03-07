/*..............................................................................
 . Copyright (c)
 .
 . The liquid_loader.dart class was created by : Alexandre Bolot
 .
 . As part of the FlutterStash project
 .
 . Last modified : 06/02/2021
 .
 . Contact : contact.alexandre.bolot@gmail.com
 .............................................................................*/

import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class LiquidLoader extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double maxWidth;
  final double maxHeight;

  const LiquidLoader({
    Key key,
    this.text,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.maxWidth,
    this.maxHeight,
  }) : super(key: key);

  @override
  _LiquidLoaderState createState() => _LiquidLoaderState();
}

class _LiquidLoaderState extends State<LiquidLoader> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: widget.maxHeight ?? 100,
          maxWidth: widget.maxWidth ?? 100,
        ),
        child: LiquidCircularProgressIndicator(
          value: animation.value,
          backgroundColor: widget.backgroundColor ?? Colors.white,
          borderColor: widget.borderColor ?? Colors.blue,
          borderWidth: widget.borderWidth ?? 5.0,
          direction: Axis.vertical,
          center: Text(widget.text ?? 'Chargement...'),
        ),
      ),
    );
  }
}
