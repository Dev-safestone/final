import 'package:flutter/material.dart';

class UserProfileTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged; // Add this line

  const UserProfileTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.onChanged, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged, // Set the onChanged callback here
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF3B3B3B),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}