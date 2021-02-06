//..................................................................................................
// Copyright (c)                                                                                   .
//                                                                                                 .
// Coded by : Alexandre BOLOT                                                                      .
//                                                                                                 .
// Last Modified : 2/6/21 6:24 PM	                                                                 .
//                                                                                                 .
// Contact : bolotalex06@gmail.com                                                                 .
//..................................................................................................

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
