import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Import the file where HomePage is defined

class DisclosureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Permissions'),
        backgroundColor: Colors.blue, // Set AppBar color to blue
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           Text(
                'To ensure that our marketplace app works properly and offers you the best possible experience, we require access to certain features on your device. Here’s why each permission is necessary:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '1. Location Access:\n   - We use your location to show nearby sellers and deals, recommend local products, and ensure that our services are relevant to your area.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '2. Camera Access:\n   - Camera access is needed for uploading product photos, scanning QR codes, and capturing images for your marketplace listings. It allows you to easily manage your product listings with high-quality visuals.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '3. Microphone Access:\n   - To enable voice search and hands-free commands within the app, microphone access enhances your ability to interact with the marketplace, especially if you prefer voice input.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'How We Use Your Data\nYour privacy is most importance to us. The data collected through these permissions is used only to improve your experience within the app, and is protected under our privacy policy. We do not share or sell your information to third parties.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Your Consent\nBy granting these permissions, you allow us to provide a more personalized and efficient experience. You can manage these permissions anytime via your device settings.\n\nIf you have any concerns about the permissions requested, please contact our support team.',
                style: TextStyle(fontSize: 16),
              ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => LoginScreen()), // Navigate to HomePage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Blue background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Rectangular shape
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 100.0), // Increase padding for larger button
                ),
                child: Text(
                  'I Agree',
                  style: TextStyle(fontSize: 20, color: Colors.white), // Increase font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
