// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login/screens/notification/all_notification.dart';
import 'package:login/screens/notification/urgent_notification.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Safe Circles',
            style: TextStyle(
              color: Color(0xFFF3F3F3),
              fontSize: 24,
              fontFamily: 'Josefin Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Color(0xFF202020),
          bottom: TabBar(
              tabs: [
                Tab(text: 'Urgent'),
                Tab(text: 'All Notifications'),
              ],
              indicatorColor: Colors.orange,
              labelColor: Colors.orange,
              unselectedLabelColor:
                  Colors.grey // Set the selected tab indicator color
              ),
        ),
        body: TabBarView(
          children: [
            // Page for "Urgent" Notifications
            UrgentNotificationsPage(),
            // Page for "All Notifications"
            AllNotificationsPage(),
          ],
        ),
      ),
    );
  }
}
