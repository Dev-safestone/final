import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CircularImageWithEditIcon extends StatefulWidget {
  @override
  _CircularImageWithEditIconState createState() =>
      _CircularImageWithEditIconState();
}

class _CircularImageWithEditIconState
    extends State<CircularImageWithEditIcon> {
  late String imageUrl = ''; // Initialize with an empty string

  Future<void> _pickImage() async {
  final picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 50,
    maxHeight: 500,
    maxWidth: 500,
  );

  if (pickedFile != null) {
    final String imagePath = pickedFile.path;

    // Generate a unique file name based on timestamp
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String fileName = 'image_$timestamp.png';

    // Get the temporary directory to store the image
    final tempDir = await getTemporaryDirectory();
    final uniqueImagePath = '${tempDir.path}/$fileName';

    // Copy the picked image to the generated file path
    final File newImage = File(imagePath);
    await newImage.copy(uniqueImagePath);

    // Save the unique image path in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_image', uniqueImagePath);

    setState(() {
      imageUrl = uniqueImagePath;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            _pickImage(); // Open the image picker when the image is tapped
          },
          child: Container(
            width: 100, // Adjust the size as needed
            height: 100, // Adjust the size as needed
            child: Stack(
              children: [
                ClipOval(
                  child: imageUrl.isNotEmpty
                      ? Image.file(
                          File(imageUrl),
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/placeholder.png', // Replace with your image path
                          width: 100, // Adjust the width as needed
                          height: 100, // Adjust the height as needed
                        ),
                ),
                Positioned(
                  top: -14,
                  right: -60,
                  left: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit, // Use any edit icon you prefer
                      color: Colors.orange, // Customize the icon color
                    ),
                    onPressed: () {
                      _pickImage(); // Open the image picker when the edit icon is tapped
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
