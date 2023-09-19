import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/screens/bottom_nav_bar/bottom_nav_bar.dart';

import 'closepopup.dart';

class PopupContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFA33737),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: 314,
        width: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                   Get.back(); // This will take you back to FirstScreen
Get.back(); // This will take you back to the previous screen, i.e., the screen before FirstScreen.
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1),
              child: Text(
                'SOS ALERT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Josefin Sans',
                  fontWeight: FontWeight.w700,
                  height: 0.83,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Authorities will reach you shortly',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Stay safe and alert!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/alert.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            ClosePopupButton(),
          ],
        ),
      ),
    );
  }
}
