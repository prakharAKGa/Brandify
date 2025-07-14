import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,  // Keeps it towards the top-left
    end: Alignment(0.7, 1.2),  // Reduce the Y extent
     colors: [
              Colors.black,
              Colors.black,
              Color(0xFF9747FF),
            ],
            stops: [0.0234, 0.8013, 1.3415],
  );
}
