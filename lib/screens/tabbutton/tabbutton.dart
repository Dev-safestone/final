import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String text;

  const TabButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width:90 , // Set the desired height
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: Colors.orange),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 51, 51, 51)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}