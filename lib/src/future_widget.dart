/*..............................................................................
 . Copyright (c)
 .
 . The future_widget.dart class was created by : Alexandre Bolot
 .
 . As part of the FlutterStash project
 .
 . Last modified : 06/02/2021
 .
 . Contact : contact.alexandre.bolot@gmail.com
 .............................................................................*/

import 'package:flutter/material.dart';
import 'package:flutter_stash/src/liquid_loader.dart';

import '../flutter_stash.dart';

class FutureWidget<T> extends StatelessWidget {
  final Future future;
  final BuilderFunction<T> builder;
  final T initialData;
  final Widget loader;

  const FutureWidget({Key key, this.future, this.builder, this.initialData, this.loader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      initialData: initialData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(snapshot.data);
        }
        return loader ?? LiquidLoader();
      },
    );
  }
}
