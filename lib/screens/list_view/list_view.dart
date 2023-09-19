import 'package:flutter/material.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return 
       Container(
        child: Center(
          child: ListView.builder(
            itemCount: 5, // Replace this with your actual item count
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0), // Add some padding for spacing
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // Rounded corners
                  ),
                  elevation: 3, // Add elevation for a shadow effect
                  color: Color(0xFF333333), // Background color
                  child: Container(
                    width: 303, // Set width
                    height: 72, // Set height
                    padding: EdgeInsets.all(8.0), // Padding inside the card
                    child: ListTile(
                      leading: CircleAvatar(child:Image.asset("assets/images/placeholder.png"),radius: 30,), // Replace with your image path
                      title: Text(
                        "Builder",
                        style: TextStyle(color: Colors.white), // White title text
                      ),
                      trailing: Switch(
                        value: false, // Replace with your desired initial value
                        activeColor: Colors.orange, // Color when turned on
                        onChanged: (bool newValue) {
                          // Handle toggle button state change here
                          // You can use setState to update the UI or handle the state change as needed
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      )
    ;
  }
}
