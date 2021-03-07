/*..............................................................................
 . Copyright (c)
 .
 . The shared.dart class was created by : Alexandre Bolot
 .
 . As part of the FlutterStash project
 .
 . Last modified : 05/02/2020
 .
 . Contact : contact.alexandre.bolot@gmail.com
 .............................................................................*/

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
