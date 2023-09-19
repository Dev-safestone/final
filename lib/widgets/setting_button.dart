import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/utils/consts.dart';

class BackButtonCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Color(0xFF333333),
      //   borderRadius: BorderRadius.all(Radius.circular(12)),
      // ),
      child: IconButton(
        onPressed: () {
          Get.back();
          // Add your button press action here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.82),
          ),
        ),
        icon: Icon(
          Icons.arrow_back,
          color: primaryColor, // White color for the icon
          size: 25, // Adjust the size as needed
        ),
      ),
    );
  }
}
