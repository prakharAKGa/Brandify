import 'package:brandify/components/gradient_container.dart';
import 'package:brandify/components/social_media_icons.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: AppGradients.primaryGradient, // Apply the updated gradient
      ),
      child: SafeArea(
        child: Stack(
          children: [
            SocialMediaIcons(),
            // Robot Image with Social Media Icons
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/image_3__2_-removebg-preview.png', // Your robot image
                  height: 250, // Adjust the height as needed
                ),
              ),
            ),
            // Text Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 200), // Space for the robot image
                  const Text(
                    'Welcome to the\nBrandify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: '"Unlock Infinite Inspiration: Let AI\n',
                        ),
                        TextSpan(
                          text: 'Ignite YOUR Imagination!',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        TextSpan(
                          text: '"',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}