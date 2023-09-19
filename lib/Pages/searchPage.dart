import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:login/api/client.dart';
import 'package:login/models/searchModel.dart';
import 'package:login/utils/consts.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  bool _showClearIcon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Hero(
            //   tag: "searchHeroKey",
            // child:
            Container(
              margin: EdgeInsets.all(12),
              child: Container(
                // width: 272.31,
                // height: 170.46,
                decoration: ShapeDecoration(
                  color:
                      Color.fromARGB(255, 115, 115, 115), //Color(0xFF515151),
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
                      child: TypeAheadField(
                        hideSuggestionsOnKeyboardHide: false,
                        minCharsForSuggestions: 2,
                        textFieldConfiguration: TextFieldConfiguration(
                          autofocus: true,
                          controller: _searchController,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search here',
                            hintStyle:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                        ),
                        suggestionsCallback: (pattern) async {
                          Search jsonList = Search();

                          jsonList = await MyApiClientServices.shared
                              .getSearchSuggestions(pattern, 1, 10);

                          List<Map<String, dynamic>> dataList = [];

                          for (final item in jsonList.data!) {
                            dataList.add(item.toJson());
                          }
                          print(dataList);
                          return dataList;
                          //return await BackendService.getSuggestions(pattern);
                        },
                        itemBuilder:
                            (context, Map<String, dynamic> suggestion) {
                          return ListTile(
                            tileColor: canvasColor,
                            leading: ClipOval(
                              child: Image.asset(
                                'assets/images/placeholder.png', // Replace with your image URL
                                width: 50.0, // Adjust the width as needed
                                height: 50.0, // Adjust the height as needed
                                fit: BoxFit
                                    .cover, // You can use BoxFit to control how the image is fitted into the circular shape
                              ),
                            ),
                            title: Text(
                              suggestion['name']!,
                              style: TextStyle(color: primaryColor),
                            ),
                            subtitle: Text(
                              '\$${suggestion['age']}',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                          );
                        },
                        layoutArchitecture: (items, scrollContoller) {
                          return Container(
                            decoration: ShapeDecoration(
                              color: Color.fromARGB(
                                  255, 41, 41, 41), //Color(0xFF515151),
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
                            child: ListView(
                              controller: scrollContoller,
                              shrinkWrap: true,
                              children: items.toList(),

                              // GridView.count(
                              //   physics: const ScrollPhysics(),
                              //   crossAxisCount:1,
                              //   crossAxisSpacing: 8,
                              //   mainAxisSpacing: 8,
                              //   childAspectRatio: 5 / 5,
                              //   shrinkWrap: true,
                              //   children: items.toList(),
                              // ),
                            ),
                          );
                        },
                        onSuggestionSelected:
                            (Map<String, dynamic> suggestion) {
                          // Navigator.of(context).push<void>(MaterialPageRoute(
                          //     builder: (context) => ProductPage(product: suggestion)));
                        },
                        suggestionsBoxDecoration: SuggestionsBoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          elevation: 8.0,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      // child: TextField(
                      //   autofocus: true,
                      //   controller: _searchController,
                      //   style: TextStyle(
                      //     color: Colors.white.withOpacity(0.5),
                      //   ),
                      //   decoration: InputDecoration(
                      //     hintText: 'Search here',
                      //     hintStyle:
                      //         TextStyle(color: Colors.white.withOpacity(0.5)),
                      //     border: InputBorder.none,
                      //   ),
                      // ),
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
            ),
            //   AlternativeLayoutArchitecture()
          ],
        ),
      ),
    );
  }
}

// In a real app, this would be a service that makes a network request.
class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    await Future<void>.delayed(Duration(seconds: 1));

    return List.generate(3, (index) {
      return {
        'name': query + index.toString(),
        'price': Random().nextInt(100).toString()
      };
    });
  }
}
