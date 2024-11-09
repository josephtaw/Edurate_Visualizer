// forgot_password_page.dart
import 'package:flutter/material.dart';
import 'styles.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Forgot Password', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: inputDecoration.copyWith(labelText: 'AUC Email'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  // Add logic to send verification code
                },
                child: Text('Send Verification Code', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
