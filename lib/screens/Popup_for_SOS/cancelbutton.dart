import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelPopupButton extends StatelessWidget {
  const CancelPopupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height:32,
        child:
        ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3B1A0E),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                minimumSize: Size(100, 32),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Cancel',
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