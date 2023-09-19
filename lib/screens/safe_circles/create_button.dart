import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/api/client.dart';
import 'package:login/screens/safe_circles/safe_circle.dart';
import 'package:login/screens/safe_circles/safe_circle_textfield.dart';
import 'package:login/screens/safe_circles/safecircle_id.dart';
import 'package:login/utils/consts.dart';

class CreateButton extends StatelessWidget {
   CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 228.70,
        height: 53.20,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            MyApiClientServices.shared.createSafeCircle();
            
          },
          child: const Text(
            'Create ',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  
}
