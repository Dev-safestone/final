import 'package:flutter/material.dart';
import 'package:login/screens/bottom_nav_bar/explore.dart';
import 'package:login/screens/bottom_nav_bar/feed.dart';
import 'package:login/screens/bottom_nav_bar/home_widget.dart';

import 'package:login/screens/profileSection/profile_tabbar.dart';
import 'package:login/screens/user_profile/user_profile.dart';

class NavigationPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    FeedWidget(),
    ExploreWidget(),
    //UserProfile(),
   ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF3F3F3F),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              color: _selectedIndex == 0 ? Colors.orange : Colors.grey,
              width: 20,
              height: 33,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/people.png',
              color: _selectedIndex == 1 ? Colors.orange : Colors.grey,
              width: 20,
              height: 33,
            ),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/book.png',
              color: _selectedIndex == 2 ? Colors.orange : Colors.grey,
              width: 20,
              height: 33,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/user.png',
              color: _selectedIndex == 3 ? Colors.orange : Colors.grey,
              width: 20,
              height: 33,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
