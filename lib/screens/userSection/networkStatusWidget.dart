import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/api/client.dart';
import 'package:login/utils/consts.dart';

class NetworkStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      height: 35,
      child: ElevatedButton(
        onPressed: () {
          MyApiClientServices.shared.sendConnectionRequest();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.82),
          ),
          minimumSize: Size(189, 31.33), // Width and height
        ),
        child: Text(
          'Add to Networkk',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.99,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
