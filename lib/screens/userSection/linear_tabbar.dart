import 'package:flutter/material.dart';

class LinearTabBarPage extends StatefulWidget {
  LinearTabBarPage({Key? key}) : super(key: key);

  @override
  _LinearTabBarPageState createState() => _LinearTabBarPageState();
}

class _LinearTabBarPageState extends State<LinearTabBarPage> with SingleTickerProviderStateMixin {
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
    return SingleChildScrollView(
      child: 
        
           Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.orange, // Indicator line color
                tabs: [
                  Tab(text: 'Post'),
                  Tab(text: 'Tags'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Content for "Post" tab
                    Center(
                      child: Text(
                        'Post Content',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    // Content for "Tags" tab
                    Center(
                      child: Text(
                        'Tags Content',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ;
  }
}
