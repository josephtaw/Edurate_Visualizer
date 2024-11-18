import 'package:flutter/material.dart';
import 'database.dart';
import 'styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<List<Map<String, dynamic>>> fetchCourses() async {
    final db = await DatabaseHelper().database;
    return db.query('courses');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: headingStyle.copyWith(color: Colors.white)),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading courses'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No courses available'));
          } else {
            final courses = snapshot.data!;
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return ListTile(
                  title: Text(course['course_name']),
                  subtitle: Text(course['department']),
                );
              },
            );
          }
        },
      ),
    );
  }
}