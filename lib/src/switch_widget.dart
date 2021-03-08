/*..............................................................................
 . Copyright (c)
 .
 . The switch_widget.dart class was created by : Alexandre Bolot
 .
 . As part of the FlutterStash project
 .
 . Last modified : 06/02/2021
 .
 . Contact : contact.alexandre.bolot@gmail.com
 .............................................................................*/

import 'package:flutter/material.dart';
import 'package:flutter_stash/flutter_stash.dart';

class SwitchWidget<T> extends StatelessWidget {
  /// Describes which Widget should be built
  /// based on the given [value]
  final Map<T, Widget> cases;
  final T value;

  /// Describes which Widget should be built
  /// if none of the [cases] matches the given [value]
  ///
  /// Defaults to :
  ///
  /// ```
  /// Container(
  ///  child: Center(
  ///    child: Text('$value not found in given cases'),
  ///  ),
  /// );
  /// ```
  final BuilderFunction defaultBuilder;

  const SwitchWidget({Key key, this.cases, this.value, this.defaultBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (cases.containsKey(value)) {
        return cases[value];
      }

      if (defaultBuilder != null) {
        return defaultBuilder(context, value);
      }

      return Container(
        child: Center(
          child: Text('$value not found in given cases'),
        ),
      );
    });
  }
}
