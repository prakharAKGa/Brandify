import 'package:brandify/screens/auth/SignUpLayout.dart';
import 'package:brandify/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class ScreenFour extends StatelessWidget {
  const ScreenFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
              Color(0xFF9747FF),
            ],
            stops: [0.0, 0.8, 1.16],
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                
                // Main Image
                Center(
                  child: Image.network(
                    'https://dashboard.codeparrot.ai/api/image/Z-QxJgggqYBhYb07/image-8.png', 
                    width: 372.2,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ),
                
                const SizedBox(height: 89),

                // Description Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    '"Begin Your Content Creation Journey with Secure Authentication: Your Gateway to a World of Creative Possibilities!"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[300],
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 180),

                // Buttons
                _buildButtons(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds Authentication Buttons
  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          _buildAuthButton(
            text: 'Sign In',
            textColor: Colors.white,
            backgroundGradient: const LinearGradient(
              colors: [
                Color(0xFFDF4A80),
                Color(0xFFD049B9),
                Color(0xFFC249B3),
                Color(0xFFB748C7),
                Color(0xFFBA51DC),
                Color(0xFFA748E2),
                Color(0xFF9747FF),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildAuthButton(
            text: 'Sign Up',
            textColor: const Color(0xFFDF4A80),
            borderColor: const Color(0xFFDF4A80),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpLayout()),
              );
            },
          ),
        ],
      ),
    );
  }

  /// Builds a button with optional gradient, border, and text styling
  Widget _buildAuthButton({
    required String text,
    required Color textColor,
    Gradient? backgroundGradient,
    Color? borderColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 280,
      height: 52,
      decoration: BoxDecoration(
        gradient: backgroundGradient,
        border: borderColor != null ? Border.all(color: borderColor) : null,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
