import 'package:flutter/material.dart';
import 'dart:async'; // To use Timer
import 'disclosure_screen.dart'; // Import the disclosure screen file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer for splash screen duration (3 seconds)
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => DisclosureScreen()), // Navigate to DisclosureScreen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Background color to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png', // Path to the logo image
              height: 250.0, // Increase the height to make the image larger
              width: 250.0, // Adjust the width proportionally to keep the image aspect ratio
              errorBuilder: (context, error, stackTrace) {
                return Text(
                  'Image', 
                  style: TextStyle(color: Colors.black), // Black text for fallback
                ); // Fallback if image isn't found
              },
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(
              color: const Color.fromARGB(255, 0, 0, 0), // Black loading spinner
            ), // Optional loading spinner
          ],
        ),
      ),
    );
  }
}

// Dummy HomePage after disclosure screen
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hospital App')),
      body: Center(child: Text('Welcome to the Hospital App!')),
    );
  }
}
