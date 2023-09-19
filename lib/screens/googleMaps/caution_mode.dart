import 'package:flutter/material.dart';
import 'package:login/screens/popup_for_caution/caution_mode_initial.dart';
import 'package:login/screens/popup_for_caution/location_fetching.dart';
import 'package:login/utils/consts.dart';

class CautionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var buttonWidth = screenWidth; // Adjust the button width as needed
    var buttonHeight = buttonWidth; // Adjust the button height as needed

    return Container(
      // width: screenWidth,
      margin: EdgeInsets.only(right: 6),
      height: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        onPressed: () {
          CautionFirstPopup();
        },
        child: Text(
          'Caution Mode',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
