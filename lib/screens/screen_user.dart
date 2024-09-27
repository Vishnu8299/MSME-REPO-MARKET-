import 'dart:async';
import 'package:flutter/material.dart';
import 'explore_screen.dart';
import 'profile_screen.dart';
import 'work_screen.dart';
import 'temp_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  final List<String> images = [
    'assets/home.png',
    'assets/home1.png',
    'assets/home2.png',
    'assets/home3.png',
    'assets/home4.png'
  ];

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentPage);

    // Set timer for auto sliding
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel
            Container(
              height: 220,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        color: Colors.black.withOpacity(0.2),
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Welcome Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome back, Developer!',
                style: TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            
            // Recommended for You Section
            _buildSectionTitle('Recommended Projects for You'),
            _buildRecommendedProjects(),

            // Company Needs Section
            _buildSectionTitle('Companies Looking for Talent'),
            _buildCompanyNeeds(),

            // Ongoing Contests Section
            _buildSectionTitle('Ongoing Contests and Challenges'),
            _buildContests(),

            // Problem Statements Section
            _buildSectionTitle('Real-World Problem Statements'),
            _buildProblemStatements(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TempScreen(),
            ),
          );
        },
        child: Icon(Icons.add_box_rounded, color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 140, 142, 146),
        tooltip: 'Add your project',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: const Color.fromARGB(255, 140, 142, 146)),
              onPressed: () {
                // Home button action
              },
            ),
            IconButton(
              icon: Icon(Icons.explore, color: const Color.fromARGB(255, 140, 142, 146)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ExploreScreen(),
                  ),
                );
              },
            ),
            SizedBox(width: 40),
            IconButton(
              icon: Icon(Icons.work, color: const Color.fromARGB(255, 140, 142, 146)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WorkScreen(),
                  ),
                );
                // Projects button action
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: const Color.fromARGB(255, 140, 142, 146)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Build Section Title with Professional Styling
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  // Build Recommended Projects
  Widget _buildRecommendedProjects() {
    final List<Map<String, dynamic>> projects = [
      {'name': 'Flutter eCommerce App', 'progress': 80},
      {'name': 'AI Chatbot for Healthcare', 'progress': 60},
      {'name': 'Portfolio Website Template', 'progress': 90},
    ];

    return Container(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: 220,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projects[index]['name'],
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text('Progress: ${projects[index]['progress']}%'),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: projects[index]['progress'] / 100,
                      backgroundColor: Colors.grey[300],
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Build Company Needs
  Widget _buildCompanyNeeds() {
    final List<String> companyNeeds = [
      'Company A: Hiring Flutter Developer',
      'Company B: AI Expert Needed',
      'Company C: Full-Stack Developer Opportunity',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: companyNeeds.map((need) {
          return ListTile(
            leading: Icon(Icons.business_center, color: const Color.fromARGB(255, 140, 142, 146)),
            title: Text(need, style: TextStyle(fontSize: 16)),
          );
        }).toList(),
      ),
    );
  }

  // Build Contests
  Widget _buildContests() {
    final List<String> contests = ['Hackathon 2024', 'CodeFest 2024'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: contests.map((contest) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.star, color: const Color.fromARGB(255, 140, 142, 146)),
              title: Text(contest, style: TextStyle(fontSize: 16)),
              subtitle: Text('Participate now and win prizes!'),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Build Problem Statements
  Widget _buildProblemStatements() {
    final List<String> problemStatements = [
      'Develop a climate impact tracker',
      'Create a real-time multiplayer game',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: problemStatements.map((problem) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.bug_report, color: const Color.fromARGB(255, 140, 142, 146)),
              title: Text(problem, style: TextStyle(fontSize: 16)),
              subtitle: Text('Propose your solution and get recognized!'),
            ),
          );
        }).toList(),
      ),
    );
  }
}
