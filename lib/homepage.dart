import 'package:flutter/material.dart';
import 'styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showDepartmentMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            ListTile(
              title: Text('Accounting'),
            ),
            ListTile(
              title: Text('Architecture'),
            ),
            ListTile(
              title: Text('Biology'),
            ),
            ListTile(
              title: Text('Business'),
            ),
            ListTile(
              title: Text('CSCE'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CSCECoursesPage()),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _showDepartmentMenu,
        ),
      ),
      body: Center(child: Text('Home Page Content')),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (index) {
          // Handle navigation based on index
        },
      ),
    );
  }
}

class CSCECoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CSCE Courses')),
      body: ListView(
        children: const [
          ListTile(title: Text('Digital Design I')),
          ListTile(title: Text('Digital Design I lab')),
          ListTile(title: Text('Fundamentals of Computing I')),
          ListTile(title: Text('Programming in Java')),
          ListTile(title: Text('Computer Architecture')),
        ],
      ),
    );
  }
}
