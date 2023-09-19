import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ClosePopupButton extends StatelessWidget {
  const ClosePopupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 32,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFEF8329),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            minimumSize: Size(100, 32),
          ),
          onPressed: () {
            Get.back(); // This will take you back to FirstScreen
            // This will take you back to the previous screen, i.e., the screen before FirstScreen.
          },
          child: Text(
            'Close',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w400,
              height: 1.12,
            ),
          ),
        ),
      ),
    );
  }
}
