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

import '../flutter_stash.dart';

class SwitchWidget<T> extends StatelessWidget {
  final Map<T, Widget> cases;
  final T value;
  final BuilderFunction defaultBuilder;

  const SwitchWidget({Key key, this.cases, this.value, this.defaultBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (cases.containsKey(value)) {
        return cases[value];
      }

      if (defaultBuilder != null) {
        return defaultBuilder(value);
      }

      return Container(
        child: Center(
          child: Text('$value not found in given cases'),
        ),
      );
    });
  }
}
