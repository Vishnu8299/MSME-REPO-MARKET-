import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to the Admin Dashboard!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Add your admin functionality here
                },
                child: Text('View Files'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add your admin functionality here
                },
                child: Text('Manage Buyers'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add more functionalities as needed
                },
                child: Text('Manage Users'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
