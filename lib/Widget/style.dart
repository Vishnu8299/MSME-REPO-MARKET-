import 'package:flutter/material.dart';

// Define all your styles here
class AppStyles {
  // AppBar Style
  static const appBarTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const appBarBackgroundColor = Colors.blue;

  // Text Field Decoration
  static const textFieldDecoration = InputDecoration(
    border: OutlineInputBorder(),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
  );

  // Button Style
  static const buttonColor = Colors.blue;

  static const buttonTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );

  static final elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: buttonColor, // Button color
    minimumSize: Size(double.infinity, 50), // Full width, custom height
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero, // Rectangle shape
    ),
    textStyle: buttonTextStyle, // Text style for the button
  );

  // Text Button Style
  static const textButtonColor = Colors.blue; // Color for text button
  static final textButtonStyle = TextButton.styleFrom(
    foregroundColor: textButtonColor, // Set the color of the text
  );

  // Dialog Styles
  static const dialogTitleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const dialogContentStyle = TextStyle(
    fontSize: 16,
  );

  static final dialogButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.blue, // Color for dialog buttons
  );
}
