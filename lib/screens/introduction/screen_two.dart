import 'package:brandify/components/gradient_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

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
            _buildPositionedImage(top: 190, left: 26, url: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/5968764.png', width: 33, height: 33),
            _buildPositionedImage(top: 40.8, left: 111.47, url: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/8359686.png', width: 34.59, height: 34.59),
            _buildPositionedImage(top: 44, right: 32, url: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/145807-1.png', width: 40, height: 40), // Changed to right
            _buildPositionedImage(top: 125, right: 43, url: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/4138124-2.png', width: 25, height: 25), // Changed to right
            _buildPositionedImage(top: 127, left: 186, url: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/4138124.png', width: 38, height: 38),
            _buildPositionedImage(top: 84, left: 241, url: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/6701799.png', width: 30, height: 30),
            _buildPositionedImage(top: 153, left: 69, url: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/10347203.png', width: 37, height: 37),
            _buildPositionedImage(top: 101, left: 120, url: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/4494477.png', width: 26, height: 26),
            _buildPositionedImage(top: 91, left: 35, url: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/733585-2.png', width: 34, height: 34),
            _buildPositionedImage(top: 150, left: 251, url: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/10264150-2.png', width: 40, height: 40),
            _buildPositionedImage(top: 150, left: 251, url: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/10264150.png', width: 40, height: 40),
            _buildPositionedImage(top: 40, left: 180, url: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/3046126.png', width: 44, height: 44),

            // Center AI Image
            Positioned(
              top: 126,
              left: 0,
              right: 0,
              child: CachedNetworkImage(
                imageUrl: 'https://dashboard.codeparrot.ai/api/image/Z-QFat4gt92eP1bW/ai-in-ne.png',
                width: 360,
                height: 330,
                fit: BoxFit.contain,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
              ),
            ),

            // Centered Text Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 200), // Space for the image
                  const Text(
                    'Effortless Content\nCreation',
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
                          text: '"Let AI Do the Heavy Lifting\nWhile You ',
                        ),
                        TextSpan(
                          text: 'Focus on What Matters Most!',
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
  Widget _buildPositionedImage({
    required double top,
    double? left,
    double? right,
    required String url,
    required double width,
    required double height,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
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