import 'package:flutter/material.dart';
import 'package:login/utils/consts.dart';

class ExploreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: canvasColor, // Replace with your feed widget content
        child: Center(
          child: Text(
            'We are working on Explore feature, stay tuned',
            style: TextStyle(color: Colors.white.withOpacity(0.4)),
          ),
        ),
      ),
    );
  }
}
