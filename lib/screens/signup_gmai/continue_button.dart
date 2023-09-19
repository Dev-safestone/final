import 'package:flutter/material.dart';

import 'package:login/api/client.dart';

class ContinueButton extends StatelessWidget {
  // Callback function

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
              MyApiClientServices.shared
                  .checkPhoneNumberAndLoginUserRegistration(context);

              //Get.to(() =>UserProfile());
            },
            //onPressed: () =>
            child: Text(
              'Continue',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
