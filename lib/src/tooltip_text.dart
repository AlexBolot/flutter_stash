/*..............................................................................
 . Copyright (c)
 .
 . The tooltip_text.dart class was created by : Alexandre Bolot
 .
 . As part of the FlutterStash project
 .
 . Last modified : 05/02/2020
 .
 . Contact : contact.alexandre.bolot@gmail.com
 .............................................................................*/

import 'package:flutter/material.dart';

/// Simple widget used to add a Tooltip to a Text widget
///
/// This allows the user to display a tooltip message when applying a long-press
/// on the displayed text widget.
class TooltipText extends StatelessWidget {
  final String text;
  final String tooltip;
  final TextStyle style;
  final TextAlign textAlign;

  const TooltipText({
    @required this.text,
    this.tooltip,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '$tooltip',
      child: Text(
        '$text',
        style: style,
        textAlign: textAlign ?? TextAlign.center,
      ),
    );
  }
}
