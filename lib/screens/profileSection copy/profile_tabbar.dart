import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/screens/bottom_nav_bar/profile.dart';
import 'package:login/screens/profileSection/post.dart';
import 'package:login/screens/profileSection/tags.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.4),
      body: SafeArea(
        child: Column(
          children: [
            //   ProfileWidget(),
            TabBar(
              labelStyle: GoogleFonts.josefinSans(fontSize: 14),
              controller: _tabController,
              tabs: [
                Tab(text: 'Post'),
                Tab(text: 'Tags'),
              ],
              indicatorColor: Colors.orange, // Indicator line color
              labelColor: Colors.orange, // Selected tab text color
              unselectedLabelColor: Colors.white, // Unselected tab text color
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverFillRemaining(
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        controller: _tabController,
                        children: [
                          Post(),
                          Tags(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
