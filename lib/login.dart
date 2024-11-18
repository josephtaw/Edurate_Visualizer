import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'homepage.dart';
import 'database.dart';
import 'sign_up_page.dart';
import 'styles.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 120),
              const SizedBox(height: 20),
              const Text(
                'Log-In',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              _buildInputField('AUC Email', emailController),
              _buildInputField('Password', passwordController, obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                ),
                onPressed: () async {
                  String email = emailController.text.trim();
                  String password = passwordController.text;

                  if (email.endsWith('@aucegypt.edu')) {
                    final db = await DatabaseHelper().database;
                    final result = await db.query(
                      'accounts',
                      where: 'email = ? AND password = ?',
                      whereArgs: [email, password],
                    );

                    if (result.isNotEmpty) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid credentials!')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please use a valid AUC email address.')),
                    );
                  }
                },
                child: const Text('Login', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SignUpPage()),
                  );
                },
                child: const Text('New user? Sign-Up', style: TextStyle(color: primaryColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: inputFieldColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}