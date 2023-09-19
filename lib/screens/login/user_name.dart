import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      width: double.infinity,
      height: 42,
      child: Padding(
        padding: EdgeInsets.only(top: 0, bottom: 4),
        child: TextField(
          style: TextStyle(color: Colors.grey, fontSize: 12),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFF3B3B3B),
            focusColor: Color(0xFF3B3B3B),
            hintText: '',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
