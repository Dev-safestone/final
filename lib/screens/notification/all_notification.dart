// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AllNotificationsPage extends StatelessWidget {
  const AllNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: Center(
        child: Text(
          'All notofication  Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
