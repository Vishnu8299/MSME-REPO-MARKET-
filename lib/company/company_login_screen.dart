import 'package:flutter/material.dart';
import 'package:msme/company/company_home.dart';
import '/Widget/style.dart'; // Ensure this path is correct
import '/company/company_registration_screen.dart'; // Adjust path if needed



class HospitalLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Login', style: AppStyles.appBarTextStyle),
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
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: AppStyles.textFieldDecoration.copyWith(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BuyerHomePage()),
                    );
                  },
                  style: AppStyles.elevatedButtonStyle, // Apply button style
                  child: Text(
                    'Login',
                    style: AppStyles.buttonTextStyle,
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HospitalRegistrationScreen()),
                    );
                  },
                  child: Text(
                    'Don\'t have an account? Register',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
