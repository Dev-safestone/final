import 'package:flutter/material.dart';

class EditCircles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      height: 35,
      child: ElevatedButton(
        onPressed: () {
          // Add your button press action here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF333333), // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.82),
          ),
          minimumSize: Size(189, 31.33), // Width and height
        ),
        child: Text(
          'Edit Circles',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.99,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
