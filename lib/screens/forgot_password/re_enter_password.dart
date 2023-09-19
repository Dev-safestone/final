import 'package:flutter/material.dart';

class ReEnterPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35, right: 25),
      child: Container(
        width: double.infinity,
        height: 46.46,
        child: TextField(
          style: TextStyle(color: Colors.grey),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFF3B3B3B),
            hintText: '*******',
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