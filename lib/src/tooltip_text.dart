//..................................................................................................
// Copyright (c)                                                                                   .
//                                                                                                 .
// Coded by : Alexandre BOLOT                                                                      .
//                                                                                                 .
// Last Modified : 6/16/19 1:21 PM	                                                                .
//                                                                                                 .
// Contact : bolotalex06@gmail.com                                                                 .
//..................................................................................................

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

  const TooltipText({@required this.text, this.tooltip, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '$tooltip',
      child: Text('$text', style: style, textAlign: textAlign ?? TextAlign.center),
    );
  }
}
