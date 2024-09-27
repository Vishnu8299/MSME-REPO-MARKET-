import 'package:flutter/material.dart';

class TempScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Project'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Name
            Text(
              'Project Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your project name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Project Description
            Text(
              'Project Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter a brief description of your project',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),

            // Google Drive Link
            Text(
              'Google Drive Link',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter the link to your project files',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // File Upload (Placeholder)
            Text(
              'Upload Project Files',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                // Placeholder for file upload action
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('File Upload Dialog (Placeholder)')),
                );
              },
              child: Text('Choose File'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 242, 242, 243),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            SizedBox(height: 16),

            // Programming Language
            Text(
              'Programming Language',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(value: 'Dart', child: Text('Dart')),
                DropdownMenuItem(value: 'Python', child: Text('Python')),
                DropdownMenuItem(value: 'JavaScript', child: Text('JavaScript')),
                DropdownMenuItem(value: 'Java', child: Text('Java')),
                DropdownMenuItem(value: 'C++', child: Text('C++')),
              ],
              onChanged: (value) {
                // Handle selection
              },
            ),
            SizedBox(height: 16),

            // Project Visibility
            Text(
              'Visibility',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text('Public'),
                Radio(value: true, groupValue: null, onChanged: (value) {}),
                Text('Private'),
                Radio(value: false, groupValue: null, onChanged: (value) {}),
              ],
            ),
            SizedBox(height: 16),

            // Create Project Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Placeholder for create project action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Project Created!')),
                  );
                },
                child: Text('Create Project'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Button color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Button padding
                  textStyle: TextStyle(fontSize: 18), // Text size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
