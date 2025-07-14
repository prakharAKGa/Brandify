import 'package:flutter/material.dart';

// Gradient background
const kGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF2A1B3D), // Dark purple
    Color(0xFF5B3A8D), // Lighter purple
  ],
);

// Text styles
const kHeadingStyle = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const kSubheadingStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
);

const kLabelStyle = TextStyle(
  color: Colors.white70,
  fontSize: 14,
);