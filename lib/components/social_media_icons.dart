import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    
    return Padding(
      padding: EdgeInsets.only(left: width * 0.11),
      child: Stack(
        children: [
          _buildPositionedIcon(33, 140, 'https://dashboard.codeparrot.ai/api/image/Z-P-1QzgNnZiU9jp/733585-3.png', 34, 34),
          _buildPositionedIcon(71, 66, 'https://dashboard.codeparrot.ai/api/image/Z-P-1QzgNnZiU9jp/10347203.png', 37, 37),
          _buildPositionedIcon(52, 235, 'https://dashboard.codeparrot.ai/api/image/Z-P-1QzgNnZiU9jp/5968764.png', 41, 41),
          _buildPositionedIcon(143, 23, 'https://dashboard.codeparrot.ai/api/image/Z-P-1QzgNnZiU9jp/3046126.png', 36, 36),
          _buildPositionedIcon(150, 285, 'https://dashboard.codeparrot.ai/api/image/Z-P-1QzgNnZiU9jp/145807-4.png', 30, 30),
          _buildPositionedIcon(228, 19, 'https://dashboard.codeparrot.ai/api/image/Z-P-1QzgNnZiU9jp/10264150.png', 40, 40),
          _buildPositionedIcon(228, 298, 'https://dashboard.codeparrot.ai/api/image/Z-P-1QzgNnZiU9jp/8359686.png', 35, 35),
        ],
      ),
    );
  }

  /// Helper function to build Positioned CachedNetworkImage widgets
  Widget _buildPositionedIcon(double top, double left, String url, double width, double height) {
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
