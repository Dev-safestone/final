import 'package:flutter/material.dart';

class MessageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Color(0xFF333333),
      //   borderRadius: BorderRadius.all(Radius.circular(12)),
      // ),
      child: IconButton(
        onPressed: () {
          // Add your button press action here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF333333), // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.82),
          ),
        ),
        icon: Icon(
          Icons.messenger,
          color: Colors.white, // White color for the icon
          size: 25, // Adjust the size as needed
        ),
      ),
    );
  }
}
