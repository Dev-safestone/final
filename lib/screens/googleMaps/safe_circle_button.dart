import 'package:flutter/material.dart';

class SafeCircleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var buttonWidth = screenWidth * 0.35; // Adjust the button width as needed
    var buttonHeight = buttonWidth * 0.4; // Adjust the button height as needed
    var imageSize = buttonWidth * 0.15; // Adjust the image size as needed

    return Container(
      margin: EdgeInsets.only(left: 6),
      width: buttonWidth,
      height: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Color(0xFF333333), // Change background color to #333333
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        onPressed: () {},
        child: Row(
          // Use Row to display an image next to the text
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              // Replace 'image_path.png' with your actual image path
              'assets/images/group.png',
              color: Colors.white,
              width: imageSize,
              height: imageSize,
            ),
            SizedBox(width: 8), // Adjust the spacing between the image and text
            Text(
              'Safe Circle',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
