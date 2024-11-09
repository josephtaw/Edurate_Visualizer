// styles.dart
import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xFFF7F7F7);
const Color primaryColor = Colors.blue;
final Color inputFieldColor = Colors.grey[200]!;

const TextStyle headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.blue,
);

const TextStyle inputTextStyle = TextStyle(
  fontSize: 16,
);

final InputDecoration inputDecoration = InputDecoration(
  filled: true,
  fillColor: inputFieldColor,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide.none,
  ),
);

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: primaryColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);
