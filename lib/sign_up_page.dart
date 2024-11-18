import 'package:flutter/material.dart';
import 'database.dart';
import 'styles.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Sign-Up', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildInputField('Full Name', nameController),
            _buildInputField('AUC Email', emailController),
            _buildInputField('Password', passwordController, obscureText: true),
            _buildInputField('Confirm Password', confirmPasswordController, obscureText: true),
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
                String name = nameController.text.trim();
                String email = emailController.text.trim();
                String password = passwordController.text;
                String confirmPassword = confirmPasswordController.text;

                if (!email.endsWith('@aucegypt.edu')) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please use a valid AUC email address.')),
                  );
                  return;
                }

                if (password != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Passwords do not match!')),
                  );
                  return;
                }

                final db = await DatabaseHelper().database;
                await db.insert('accounts', {
                  'full_name': name,
                  'email': email,
                  'password': password,
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Account created successfully!')),
                );

                Navigator.pop(context);
              },
              child: const Text('Register', style: TextStyle(fontSize: 18)),
            ),
          ],
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