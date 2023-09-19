import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/screens/Popup_for_SOS/bulletpoints.dart';
import 'package:login/screens/Popup_for_SOS/cancelbutton.dart';
import 'package:login/screens/Popup_for_SOS/Alertbutton.dart';

void FirstPopup() {
  Get.dialog(
    AlertDialog(
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
              'Are you sure you want to create\n an SOS Alert? It will notify',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: BulletPointText('All Contacts'),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: BulletPointText('All Circles'),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: BulletPointText('All Emergency Authorities'),
            ),
            SizedBox(height: 40),
            Center(
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlertPopupButton(),
                  SizedBox(width: 10),
                  CancelPopupButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
