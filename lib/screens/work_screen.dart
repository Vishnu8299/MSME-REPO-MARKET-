import 'package:flutter/material.dart';

class WorkScreen extends StatelessWidget {
  final List<Map<String, dynamic>> userProjects = [
    {
      'name': 'Portfolio Website',
      'description': 'A personal portfolio built using Flutter Web.',
      'language': 'Dart',
      'stars': 45,
      'creationDate': 'Jan 12, 2023'
    },
    {
      'name': 'E-commerce App',
      'description': 'An e-commerce app for mobile platforms.',
      'language': 'Flutter',
      'stars': 78,
      'creationDate': 'Feb 8, 2023'
    },
    {
      'name': 'AI Chatbot',
      'description': 'A healthcare assistant powered by AI and NLP.',
      'language': 'Python',
      'stars': 102,
      'creationDate': 'March 3, 2023'
    },
    {
      'name': 'Task Manager App',
      'description': 'A to-do list and task management app.',
      'language': 'Flutter',
      'stars': 60,
      'creationDate': 'April 10, 2023'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Projects'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: userProjects.length,
        itemBuilder: (context, index) {
          final project = userProjects[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        project['name'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      // Stars or Likes (like GitHub)
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          SizedBox(width: 4),
                          Text(
                            project['stars'].toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Project Description
                  Text(
                    project['description'],
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 8),

                  // Language and Date Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.code, color: Colors.blueAccent, size: 18),
                          SizedBox(width: 4),
                          Text(
                            project['language'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Created on ${project['creationDate']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
