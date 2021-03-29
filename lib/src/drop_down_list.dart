/*..............................................................................
 . Copyright (c)
 .
 . The drop_down_list.dart class was created by : Alexandre Bolot
 .
 . As part of the FlutterStash project
 .
 . Last modified : 07/03/2021
 .
 . Contact : contact.alexandre.bolot@gmail.com
 .............................................................................*/

import 'package:flutter/material.dart';

typedef ItemBuilder = List<DropdownMenuItem> Function(BuildContext context, List<String>? values);
typedef SelectedItemsBuilder = List<Widget> Function(BuildContext context, List<String>? values);

class DropDownList extends StatelessWidget {
  /// List of values that the user can select
  final List<String>? values;

  /// The value of the currently selected [DropdownMenuItem].
  ///
  /// It has contained in the [values] field.
  final String? value;

  /// Callback applied when the user selects a value.
  ///
  /// Defaults to a simple `print(value)`
  final ValueChanged<String?> onSelect;

  /// Code used to build the items in list when the DropDownList is expanded
  ///
  /// Defaults to :
  ///
  /// ```
  /// values.map((value) {
  ///   return DropdownMenuItem(
  ///     value: value,
  ///     child: Text(value.toFirstUpper()),
  ///   );
  /// }).toList()
  /// ```
  final ItemBuilder? itemBuilder;

  /// Code used to build the selected item displayed when the DropDownList is collapsed
  ///
  /// Defaults to :
  ///
  /// ```
  /// values.map((value) {
  ///   return Center(
  ///     child: Text(value),
  ///   );
  /// }).toList();
  ///
  /// ```
  final SelectedItemsBuilder? selectedItemBuilder;

  /// The widget displayed under the DropDownList when it's collapsed
  ///
  /// Defaults to a simple line colored : Color(0xFFBDBDBD)
  final Widget? underline;

  /// The z-coordinate at which to place the menu when open.
  ///
  /// Defaults to 2
  final int elevation;

  /// Reduce the button's height.
  ///
  /// Defaults to `true`
  final bool isDense;

  /// The widget displayed when no value is selected
  final Widget? hint;

  DropDownList({
    Key? key,
    this.values,
    this.value,
    this.onSelect = print,
    this.underline,
    this.elevation = 2,
    this.isDense = true,
    this.hint,
    this.itemBuilder,
    this.selectedItemBuilder,
  }) : super(key: key);

  final ItemBuilder _defaultItemBuilder = (_, values) {
    return values!.map((value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value),
      );
    }).toList();
  };

  final SelectedItemsBuilder _defaultSelectedItemBuilder = (_, values) {
    return values!.map((value) {
      return Center(
        child: Text(value),
      );
    }).toList();
  };

  @override
  Widget build(BuildContext context) {
    var itemBuilder = this.itemBuilder ?? _defaultItemBuilder;
    var selectedItemBuilder = this.selectedItemBuilder ?? _defaultSelectedItemBuilder;

    return DropdownButton(
      hint: hint,
      underline: underline,
      elevation: elevation,
      value: value,
      items: itemBuilder(context, values),
      onChanged: (dynamic value) => onSelect(value),
      isDense: isDense,
      selectedItemBuilder: (BuildContext context) => selectedItemBuilder(context, values),
    );
  }
}
