//..................................................................................................
// Copyright (c)                                                                                   .
//                                                                                                 .
// Coded by : Alexandre BOLOT                                                                      .
//                                                                                                 .
// Last Modified : 6/16/19 1:13 PM	                                                                .
//                                                                                                 .
// Contact : bolotalex06@gmail.com                                                                 .
//..................................................................................................

import 'package:flutter/material.dart';

/// Returns the adequate text color to contrast with a given [background] Color
Color contrastOf(Color background) {
  var brightness = ThemeData.estimateBrightnessForColor(background);
  return brightness == Brightness.light ? Colors.black : Colors.white;
}

/// Formats a given [string] to used a 'sentence' format :
///
/// UPPER CASE PHRASE -> Upper case phrase
/// lower case phrase -> Lower case phrase
/// Mixed CASE phrase -> Mixed case phrase
///
String toFirstUpper(String string) {
  return string[0].toUpperCase() + string.substring(1).toLowerCase();
}

/// Used as a simplified reducer method
///
/// Useful to simplify chained calls :
///
/// ```dart
///
/// myItems.map((item) => item.price).reduce(sum);
///
/// ```
double sum(double a, double b) => a + b;
