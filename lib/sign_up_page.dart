import 'package:flutter/material.dart';
import 'styles.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  void _uploadTranscript() {
    // Implement file upload functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sign-Up', style: headingStyle),
            const SizedBox(height: 20),
            TextField(
              decoration: inputDecoration.copyWith(labelText: 'Full Name'),
              style: inputTextStyle,
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: inputDecoration.copyWith(labelText: 'AUC Email'),
              style: inputTextStyle,
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: inputDecoration.copyWith(labelText: 'Password'),
              obscureText: true,
              style: inputTextStyle,
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: inputDecoration.copyWith(labelText: 'Confirm Password'),
              obscureText: true,
              style: inputTextStyle,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadTranscript,
              style: buttonStyle,
              child: Text('Upload your unofficial transcript'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Perform signup action
              },
              style: buttonStyle,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
