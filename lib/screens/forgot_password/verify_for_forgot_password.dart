import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'confirm_password.dart';

class verifyForForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Center(
        child: Container(
          width: 302,
          height: 53.20,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFF2974D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              Get.to(() => ConfirmPassword());
            },
            child: Text(
              'Verify',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Avenir'),
            ),
          ),
        ),
      ),
    );
  }
}
