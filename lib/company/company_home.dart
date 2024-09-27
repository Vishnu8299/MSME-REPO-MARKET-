import 'package:flutter/material.dart';

class BuyerHomePage extends StatefulWidget {
  @override
  _BuyerHomePageState createState() => _BuyerHomePageState();
}

class _BuyerHomePageState extends State<BuyerHomePage> {
  int _selectedIndex = 0;

  // List of widgets for each navigation item
  static List<Widget> _pages = <Widget>[
    HomePage(),  // Home page widget
    ProjectsPage(),  // Projects page widget
    BestUserPage(),  // Best user profile widget
    ProblemStatementPage(),  // Problem statement page widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RepoMarket'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart page
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to buyer profile
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],  // Display the selected page

      // Bottom navigation bar for switching between home, projects, best user, and problem statement
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Best User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Problem Statement',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

// Home page widget
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome to RepoMarket Home!', style: TextStyle(fontSize: 20)),
    );
  }
}

// Projects page widget
class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Best User projects', style: TextStyle(fontSize: 20)),
    );
  }
}


// Best User Profile Page widget
class BestUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Best User Profile', style: TextStyle(fontSize: 20)),
    );
  }
}

// Problem Statement Page widget
class ProblemStatementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Problem Statement', style: TextStyle(fontSize: 20)),
    );
  }
}
