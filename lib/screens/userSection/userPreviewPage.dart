import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/api/client.dart';
import 'package:login/models/userProfileModel.dart';
import 'package:login/screens/bottom_nav_bar/LoadingProfile.dart';
import 'package:login/screens/bottom_nav_bar/profile.dart';
import 'package:login/screens/profileSection/post.dart';
import 'package:login/screens/profileSection/tags.dart';
import 'package:shimmer/shimmer.dart';

class UserPage extends StatefulWidget {
  final id;
  const UserPage({super.key, required this.id});

  @override
  _UserPagetate createState() => _UserPagetate();
}

class _UserPagetate extends State<UserPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late UserProfile userProfile;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    getProfileData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  getProfileData() async {
    userProfile =
        await MyApiClientServices.shared.getuserProfileData(widget.id);
    isLoaded = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.4),
      body: SafeArea(
          child: !isLoaded
              ? Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 79, 79, 79),
                  highlightColor: Color.fromARGB(255, 171, 171, 171),
                  enabled: true,
                  child: Column(
                    children: [
                      ProfileWidgetLoading(),
                      TabBar(
                        labelStyle: GoogleFonts.josefinSans(fontSize: 14),
                        controller: _tabController,
                        tabs: [
                          Tab(text: 'Post'),
                          Tab(text: 'Tags'),
                        ],
                        indicatorColor: Colors.orange, // Indicator line color
                        labelColor: Colors.orange, // Selected tab text color
                        unselectedLabelColor:
                            Colors.white, // Unselected tab text color
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
                                    Text(""),
                                    Text(""),
                                    // Post(),
                                    // Tags(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
              : Column(
                  children: [
                    ProfileWidget(
                      userProfile: userProfile,
                    ),
                    TabBar(
                      labelStyle: GoogleFonts.josefinSans(fontSize: 14),
                      controller: _tabController,
                      tabs: [
                        Tab(text: 'Post'),
                        Tab(text: 'Tags'),
                      ],
                      indicatorColor: Colors.orange, // Indicator line color
                      labelColor: Colors.orange, // Selected tab text color
                      unselectedLabelColor:
                          Colors.white, // Unselected tab text color
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
                )),
    );
  }
}
