import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  // Sample user data
  final String profileImageUrl = 'https://randomuser.me/api/portraits/men/75.jpg';
  final String userName = 'John Doe';
  final String userEmail = 'johndoe@example.com';
  final String userBio = 'Open-source enthusiast | Flutter developer | Tech blogger.';
  final int repositories = 35;
  final int followers = 230;
  final int following = 180;

  // Sample projects with their sale prices
  final List<Map<String, dynamic>> recentProjects = [
    {'title': 'Flutter News App', 'salePrice': 300.0},
    {'title': 'Portfolio Website', 'salePrice': 500.0},
    {'title': 'Tic-Tac-Toe Game', 'salePrice': 150.0},
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate total earnings by summing up the sale prices
    final double totalEarnings = recentProjects.fold(0.0, (sum, project) => sum + project['salePrice']);

    return Scaffold(
appBar: AppBar(
  title: Text(userName),
  actions: [
    IconButton(
      icon: Icon(Icons.logout),
      onPressed: () {
        // Navigate to logon_screen.dart
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    ),
  ],
),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture and Bio Section
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          userBio,
                          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.email, size: 18),
                            SizedBox(width: 6),
                            Text(userEmail),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Stats Section (Repositories, Followers, Following)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatColumn('Repositories', repositories),
                  _buildStatColumn('Followers', followers),
                  _buildStatColumn('Following', following),
                ],
              ),
              SizedBox(height: 24),

              // Total Earnings Section
              _buildSectionTitle('Total Earnings'),
              Text(
                '\$${totalEarnings.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 24),

              // Recent Projects Section
              _buildSectionTitle('Recent Projects'),
              Column(
                children: recentProjects.map((project) => _buildProjectCard(project)).toList(),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to create the stat column (Repositories, Followers, Following)
  Widget _buildStatColumn(String label, int count) {
    return Column(
      children: [
        Text(
          '$count',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ],
    );
  }

  // Helper to create section titles
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper to create project cards
  Widget _buildProjectCard(Map<String, dynamic> project) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          project['title'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Sold for: \$${project['salePrice']}'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to project details screen
        },
      ),
    );
  }
}
