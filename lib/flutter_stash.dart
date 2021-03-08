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
import 'package:flutter_stash/src/drop_down_list.dart';

export 'src/bubble_loader.dart';
export 'src/future_widget.dart';
export 'src/liquid_loader.dart';
export 'src/shared.dart';
export 'src/splash_screen.dart';
export 'src/switch_widget.dart';
export 'src/tooltip_text.dart';

typedef BuilderFunction<T> = Widget Function(BuildContext context, T data);

var a = DropDownList(
  values: ['option 1', 'option 2', 'option 3'],
  value: 'option 1',
  elevation: 4,
  hint: Text('Select an option'),
  isDense: true,
  onSelect: (value) => print('User selected $value'),
  itemBuilder: (context, values) => values.map((value) {
    return DropdownMenuItem(
      value: value,
      child: Text(value),
    );
  }).toList(),
  selectedItemBuilder: (context, values) => values.map((value) {
    return Center(child: Text(value));
  }).toList(),
);
