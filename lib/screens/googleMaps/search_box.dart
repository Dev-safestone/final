import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Pages/detailsScreen.dart';
import 'package:login/Pages/searchPage.dart';

class MySearchBar extends StatefulWidget {
  @override
  _MySearchBarState createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  TextEditingController _searchController = TextEditingController();
  bool _showClearIcon = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _showClearIcon = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width: 272.31,
        // height: 170.46,
        decoration: ShapeDecoration(
          color: Color.fromARGB(255, 115, 115, 115), //Color(0xFF515151),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x11007AFF),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 8),
              child: Icon(
                Icons.search,
                color: Colors.white.withOpacity(0.5),
                size: 16,
              ),
            ),
            Expanded(
              child: TextField(
                // onTap: () {
                //   Get.to(() => SearchPage());

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) {
                //   return SearchPage();
                // }));
                //},
                controller: _searchController,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
                decoration: InputDecoration(
                  hintText: 'Search here',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  border: InputBorder.none,
                ),
              ),
            ),
            if (_showClearIcon)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _searchController.clear();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.clear, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
