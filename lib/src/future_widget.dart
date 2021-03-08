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
import 'package:flutter_stash/flutter_stash.dart';
import 'package:flutter_stash/src/liquid_loader.dart';

class FutureWidget<T> extends StatelessWidget {

  /// The future to wait on.
  ///
  /// When the future is resolved, the value
  /// will be passed to the [builder] callback
  final Future future;

  /// The callback used to build the content of this widget
  ///
  /// * If the [future] has resolved or an [initialData] is given, it will build
  /// using the child widget based on the data and the context.
  ///
  /// * If the [future] hasn't resolved yet and [initialData] is `null`, it will build
  /// using the given [loader].
  ///
  /// * If no [loader] is provided, a [LiquidLoader] is used.
  final BuilderFunction<T> builder;

  /// The initial data used by the [builder] callback until the [future] resolves
  final T initialData;

  /// The widget to display if the [future] hasn't resolved yet and [initialData] is `null`
  final Widget loader;

  const FutureWidget({Key key, this.future, this.builder, this.initialData, this.loader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      initialData: initialData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(context, snapshot.data);
        }
        return loader ?? LiquidLoader();
      },
    );
  }
}
