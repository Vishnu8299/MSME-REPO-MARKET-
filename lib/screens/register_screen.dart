import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import your login screen
import '/Widget/style.dart'; // Import your AppStyles

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: AppStyles.appBarTextStyle),
        backgroundColor: AppStyles.appBarBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // App Logo at the top
                Image.asset(
                  'assets/logo.png',
                  height: 220,
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: AppStyles.textFieldDecoration.copyWith(
                    labelText: 'First Name',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: AppStyles.textFieldDecoration.copyWith(
                    labelText: 'Last Name',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: AppStyles.textFieldDecoration.copyWith(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: AppStyles.textFieldDecoration.copyWith(
                    labelText: 'Address',
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: AppStyles.textFieldDecoration.copyWith(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 16),

                // Register Button with AppStyles
                ElevatedButton(
                  onPressed: () {
                    // After registration, navigate to the login page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: AppStyles.elevatedButtonStyle,
                  child: Text(
                    'Register',
                    style: AppStyles.buttonTextStyle,
                  ),
                ),

                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: AppStyles.textButtonStyle,
                  child: Text('Already have an account?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
