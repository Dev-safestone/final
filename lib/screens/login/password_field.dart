import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35, right: 25),
      child: Container(
        width: double.infinity,
        height: 46.46,
        child: TextFormField(
          obscureText: _obscureText,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: '*********',
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Color(0xFF3B3B3B),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            suffix: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                _obscureText ? 'Show' : 'Hide',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ),
          
        ),
        obscuringCharacter: '*',
      ),
     ) );
  }
}
