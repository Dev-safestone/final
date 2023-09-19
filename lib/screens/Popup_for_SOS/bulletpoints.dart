import 'package:flutter/material.dart';

class BulletPointText extends StatelessWidget {
  final String text;

  BulletPointText(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '• ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
          child: Text(
            text,
            
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}