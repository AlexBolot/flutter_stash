/*..............................................................................
 . Copyright (c)
 .
 . The flutter_stash.dart class was created by : Alexandre Bolot
 .
 . As part of the FlutterStash project
 .
 . Last modified : 07/03/2021
 .
 . Contact : contact.alexandre.bolot@gmail.com
 .............................................................................*/

import 'package:flutter/material.dart';

export 'src/bubble_loader.dart';
export 'src/future_widget.dart';
export 'src/liquid_loader.dart';
export 'src/shared.dart';
export 'src/splash_screen.dart';
export 'src/switch_widget.dart';
export 'src/tooltip_text.dart';

typedef BuilderFunction<T> = Widget Function(BuildContext context, T? data);
