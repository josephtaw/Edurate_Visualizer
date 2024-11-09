import 'package:flutter/material.dart';
import 'styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
            const ListTile(title: Text('Accounting')),
            const ListTile(title: Text('Architecture')),
            const ListTile(title: Text('Biology')),
            const ListTile(title: Text('Business')),
            ListTile(
              title: const Text('CSCE'),
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
        title: Text('Home', style: headingStyle.copyWith(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _showDepartmentMenu,
        ),
      ),
      body: const Center(child: Text('Home Page Content', style: inputTextStyle)),
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
  const CSCECoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSCE Courses', style: headingStyle.copyWith(color: Colors.white)),
      ),
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
