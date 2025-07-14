import 'package:flutter/material.dart';
class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0.0, -0.5), // Move the center higher up
          radius: 1.5, // Increase the radius for a smoother spread
          colors: [
            const Color(0xFF9747FF), // Bright purple at the center
            const Color(0xFF532859).withOpacity(0.8), // Darker purple
            const Color(0xFF1A0B1E), // Very dark shade, almost black
          ],
          stops: const [
            0.0,   // Start with bright purple
            0.5,   // Transition to darker purple
            1.0,   // End with very dark shade
          ],
          transform: const GradientRotation(3.14159 / 2), // 90 degrees rotation
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.4), // Reduced opacity for the overlay
      ),
    );
  }
}