import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'confirm_password.dart';

class SaveChangesPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 228.70,
        height: 53.20,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFF2974D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Save Changes',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Avenir'),
          ),
        ),
      ),
    );
  }
}