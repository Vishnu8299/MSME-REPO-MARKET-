import 'package:flutter/material.dart';
import '/Widget/style.dart'; // Import the style file
import '/admin/super_admin_home_page.dart'; // Import Admin Home Page

class AdminLoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Login', style: AppStyles.appBarTextStyle),
        backgroundColor: AppStyles.appBarBackgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // App Logo at the top (if needed)
              Image.asset(
                'assets/logo.png', // Replace with your app logo asset
                height: 220,
              ),
              SizedBox(height: 15),
              TextField(
                controller: _usernameController,
                decoration: AppStyles.textFieldDecoration.copyWith(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: AppStyles.textFieldDecoration.copyWith(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Hardcoded admin credentials for login
                  if (_usernameController.text == 'admin' &&
                      _passwordController.text == '123456') {
                    // Navigate to AdminHomePage after successful login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminHomePage(),
                      ),
                    );
                  } else {
                    // Show error dialog for wrong credentials
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Login Failed', style: AppStyles.dialogTitleStyle),
                        content: Text('Invalid username or password.', style: AppStyles.dialogContentStyle),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Login', style: AppStyles.buttonTextStyle),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppStyles.buttonColor, // Button color
                  minimumSize: Size(double.infinity, 50), // Full width, custom height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Rectangle shape
                  ),
                  textStyle: AppStyles.buttonTextStyle, // Text style for the button
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
