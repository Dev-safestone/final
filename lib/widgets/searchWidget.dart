import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:login/api/client.dart';
import 'package:login/models/searchModel.dart';

import 'package:login/utils/consts.dart';

import '../screens/userSection/userPreviewPage.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _searchController = TextEditingController();
  bool _showClearIcon = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Container(
        // width: 272.31,
        // height: 170.46,
        decoration: ShapeDecoration(
          color: const Color.fromARGB(255, 115, 115, 115), //Color(0xFF515151),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: [
            const BoxShadow(
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
                loadingBuilder: (context) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                },
                debounceDuration: const Duration(milliseconds: 500),
                noItemsFoundBuilder: (context) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        // shadows: [
                        //   BoxShadow(
                        //     color: primaryColor,
                        //     blurRadius: 20,
                        //     offset: Offset(0, 10),
                        //   ),
                        // ],
                      ),
                      child: Text(
                        "No users found",
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                  );
                },
                hideSuggestionsOnKeyboardHide: false,
                minCharsForSuggestions: 2,
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: false,
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
                itemBuilder: (context, Map<String, dynamic> suggestion) {
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
                      style: const TextStyle(color: primaryColor),
                    ),
                    subtitle: Text(
                      '${suggestion['userId']}',
                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    ),
                  );
                },
                layoutArchitecture: (items, scrollContoller) {
                  return Container(
                    decoration: const ShapeDecoration(
                      color:
                          Color.fromARGB(255, 41, 41, 41), //Color(0xFF515151),
                      shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(16),
                          ),
                    ),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      controller: scrollContoller,
                      shrinkWrap: true,
                      children: items.toList(),
                    ),
                  );
                },
                onSuggestionSelected: (Map<String, dynamic> suggestion) {
                  print('${suggestion['_id']}');
                  Navigator.of(context).push<void>(MaterialPageRoute(
                      builder: (context) =>
                          UserPage(id: '${suggestion['_id']}')));
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
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.clear, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
