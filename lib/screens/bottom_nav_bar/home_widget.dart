// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Pages/searchPage.dart';
import 'package:login/api/client.dart';
import 'package:login/screens/googleMaps/bottom_container.dart';
import 'package:login/screens/googleMaps/google_maps_screen.dart';
import 'package:login/screens/bottom_nav_bar/custom_tapbar.dart';
import 'package:login/screens/googleMaps/search_box.dart';
import 'package:login/utils/SharePrefs.dart';
import 'package:login/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/searchWidget.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      appBar: AppBar(
        shadowColor: canvasColor,
        backgroundColor: canvasColor,
        title: Column(children: [
          Container(
            color: canvasColor,
            // backgroundColor: Color.fromARGB(255, 51, 51, 51),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.only(
            //       // bottomLeft: Radius.circular(20.0),
            //       // bottomRight: Radius.circular(20.0),
            //       ),
            // ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Hi, ${UserSharedPreferences.getUsername()!}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Handle notification icon tap here
                      },
                      child: Image.asset(
                        'assets/images/bell.png', // Replace with your notification icon image path
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () {
                        // Handle message icon tap here
                      },
                      child: Image.asset(
                        'assets/images/speech-bubble.png', // Replace with your message icon image path
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Transform(
          //   transform: Matrix4.translationValues(0, 90, 10),
          //  child:
        ]),
      ),
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            padding: EdgeInsets.all(2),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  SizedBox(width: 8),
                  CustomElevatedButton(text: 'Family', onPressed: () {}),
                  SizedBox(width: 8),
                  CustomElevatedButton(text: 'Friends', onPressed: () {}),
                  SizedBox(width: 8),
                  CustomElevatedButton(text: 'Relatives', onPressed: () {}),
                  SizedBox(width: 8),
                  CustomElevatedButton(text: 'Lorem', onPressed: () {}),
                  SizedBox(width: 8),
                  CustomElevatedButton(text: 'Lorem', onPressed: () {}),
                  SizedBox(width: 8),
                ],
              ),
              //  ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Transform(
                  transform: Matrix4.translationValues(0, 24, 2),
                  child: GoogleMapScreen())),
          Transform(
            transform: Matrix4.translationValues(0, 20, 2),
            child: Hero(
                tag: "searchHeroKey",
                child: Container(
                    margin: EdgeInsets.only(right: 40, left: 40),
                    child: Center(
                      child: SearchWidget(),
                      // Container(
                      //   // width: 272.31,
                      //   // height: 170.46,
                      //   decoration: ShapeDecoration(
                      //     color: Color.fromARGB(
                      //         255, 115, 115, 115), //Color(0xFF515151),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(16),
                      //     ),
                      //     shadows: [
                      //       BoxShadow(
                      //         color: Color(0x11007AFF),
                      //         blurRadius: 20,
                      //         offset: Offset(0, 10),
                      //       ),
                      //     ],
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       Padding(
                      //         padding:
                      //             const EdgeInsets.only(left: 16.0, right: 8),
                      //         child: Icon(
                      //           Icons.search,
                      //           color: Colors.white.withOpacity(0.5),
                      //           size: 20,
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: InkWell(
                      //           onTap: () {
                      //             Get.to(() => SearchPage());
                      //           },
                      //           child: Container(
                      //             padding: const EdgeInsets.only(
                      //                 left: 0.0, right: 8, top: 18),
                      //             height: 50,
                      //             child: Text(
                      //               "Search here",
                      //               style: TextStyle(
                      //                 fontSize: 16,
                      //                 color: Colors.white.withOpacity(0.5),
                      //               ),

                      //               // Navigator.push(context,
                      //               //     MaterialPageRoute(builder: (context) {
                      //               //   return SearchPage();
                      //               // }));
                      //               //},

                      //               // style: TextStyle(
                      //               //   color: Colors.white.withOpacity(0.5),
                      //               // ),
                      //               // decoration: InputDecoration(
                      //               //   hintText: 'Search here',
                      //               //   hintStyle: TextStyle(
                      //               //       color: Colors.white.withOpacity(0.5)),
                      //               //   border: InputBorder.none,
                      //               // ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ))),
          ),
        ],
      ),
    );
  }
}
