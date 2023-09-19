import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  void _onCheckboxChanged(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: _onCheckboxChanged,
      side: BorderSide(
    color: Colors.grey,
    width: 2.0,
    style: BorderStyle.solid,
  ),
    );
  }
}
