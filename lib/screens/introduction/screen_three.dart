import 'package:brandify/components/gradient_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: AppGradients.primaryGradient,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            // Social Media Icons (Shifted Slightly to Center-Left)
            _buildPositionedImage(41, 80, 'https://dashboard.codeparrot.ai/api/image/Z-Qt5gggqYBhYb03/4494477.png', 26, 26),
            _buildPositionedImage(54, 150, 'https://dashboard.codeparrot.ai/api/image/Z-Qt5gggqYBhYb03/10264150.png', 40, 40),
            _buildPositionedImage(48, 226, 'https://dashboard.codeparrot.ai/api/image/Z-Qt5gggqYBhYb03/6701799.png', 30, 30),
            _buildPositionedImage(78, 274, 'https://dashboard.codeparrot.ai/api/image/Z-Qt5gggqYBhYb03/145807-1.png', 40, 40),
            _buildPositionedImage(87, 10, 'https://dashboard.codeparrot.ai/api/image/Z-Qt5gggqYBhYb03/733585-2.png', 26, 26),
            _buildPositionedImage(101, 73, 'https://dashboard.codeparrot.ai/api/image/Z-Qt5gggqYBhYb03/4138124.png', 40, 40),
            _buildPositionedImage(113, 221, 'https://dashboard.codeparrot.ai/api/image/Z-Qt5gggqYBhYb03/4138124-2.png', 20, 20),
            _buildPositionedImage(126, 145, 'https://dashboard.codeparrot.ai/api/image/Z-Qt5gggqYBhYb03/3046126.png', 44, 44),
            _buildPositionedImage(153, 298, 'https://dashboard.codeparrot.ai/api/image/Z-Qt5gggqYBhYb03/10347203.png', 31, 31),
            _buildPositionedImage(158, 370, 'https://dashboard.codeparrot.ai/api/image/Z-Qt5gggqYBhYb03/145807-4.png', 26, 26),

            // Main Image (Shifted Closer to Social Icons)
            Positioned(
              top: 180,  // Moved up slightly
              left: 0,
              right: 0,
              child: CachedNetworkImage(
                imageUrl: 'https://dashboard.codeparrot.ai/api/image/Z-Qt5gggqYBhYb03/image-4.png',
                width: 360,
                height: 300, // Adjusted size
                fit: BoxFit.contain,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
              ),
            ),

            // Text Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 350), // Adjusted space for better alignment
                  const Text(
                    'Creativity at Your\nFingertips',
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
                          text: '"Explore Customizable Templates,\nInstant ',
                        ),
                        TextSpan(
                          text: 'Insights for Seamless Content Creation!',
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

  /// Helper function to create Positioned CachedNetworkImage widgets
  Widget _buildPositionedImage(double top, double left, String url, double width, double height) {
    return Positioned(
      top: top,
      left: left,
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
      ),
    );
  }
}
