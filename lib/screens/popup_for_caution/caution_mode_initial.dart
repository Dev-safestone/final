import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login/screens/popup_for_caution/caution_cancel_button.dart';

import 'alert_caution_button.dart';

void CautionFirstPopup() {
  Get.dialog(
    AlertDialog(
      backgroundColor: Color(0xFF773317),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: 270,
        width: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Get.back();
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
                'Caution Mode',
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
            SizedBox(height: 30),
            Text(
              'Are you sure? We will alert all\n your Safe Circles to check your\n location.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 50),
            
            Center(
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                     AlertCautionPopupButton () ,                                   // AlertPopupButton(),
                  SizedBox(width: 10),
                      CancelCautionPopupButton(),                                                        
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
