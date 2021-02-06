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
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class SwitchWidget<T> extends StatelessWidget {
  final Map<T, Widget> cases;
  final T value;

  const SwitchWidget({Key key, this.cases, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (cases.containsKey(value))
        return cases[value];
      else
        return Container(
          child: Center(
            child: Text('$value not found in given cases'),
          ),
        );
    });
  }
}

class Bob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SwitchWidget(
      value: 'Hello',
      cases: {
        'Hello': Text('Hello World', style: TextStyle(color: Colors.greenAccent)),
        'Bye': Text('See you soon', style: TextStyle(color: Colors.redAccent)),
      },
    );
  }
}
