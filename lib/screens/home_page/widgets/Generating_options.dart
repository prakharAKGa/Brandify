import 'package:brandify/screens/post_creation/captions/captions_input_screen.dart';
import 'package:brandify/screens/post_creation/ideas/ideas_input_screen.dart';
import 'package:brandify/screens/post_creation/images/image_input_screen.dart';
import 'package:brandify/screens/post_creation/post/post_generation_input_screen.dart';
import 'package:brandify/screens/post_creation/videos/video_generation_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GenerationOptionsComponent extends StatelessWidget {
  const GenerationOptionsComponent({Key? key}) : super(key: key);

  Widget _buildOptionCard({
    required String imagePath,
    required String title,
    required VoidCallback onTap, // Added onTap callback
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180, // Increased width
        height: 100, // Reduced height
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: const GradientBoxBorder(
            gradient: LinearGradient(
              colors: [
                Color(0xFFDF4A80),
                Color(0xFF9747FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            width: 3, // Increased border width
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: imagePath,
              width: 50,
              height: 60,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 40,
        mainAxisSpacing: 20,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildOptionCard(
            imagePath: 'https://dashboard.codeparrot.ai/api/image/Z-eZqnn5m-GBkO9V/vuesax-b.png',
            title: 'Idea Generation',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const IdeasInputScreen())),
          ),
          _buildOptionCard(
            imagePath: 'https://dashboard.codeparrot.ai/api/image/Z-eZqnn5m-GBkO9V/vuesax-b-2.png',
            title: 'Post Generation',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PostCreationScreen())),
          ),
          _buildOptionCard(
            imagePath: 'https://dashboard.codeparrot.ai/api/image/Z-eZqnn5m-GBkO9V/vuesax-b-3.png',
            title: 'Prompt Generation',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PromptGenerationScreen())),
          ),
          _buildOptionCard(
            imagePath: 'https://dashboard.codeparrot.ai/api/image/Z-eZqnn5m-GBkO9V/vuesax-b-4.png',
            title: 'Image Generation',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageInputScreen())),
          ),
          _buildOptionCard(
            imagePath: 'https://dashboard.codeparrot.ai/api/image/Z-eZqnn5m-GBkO9V/vuesax-b-5.png',
            title: 'Caption Generation',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CaptionsInputScreen())),
          ),
          _buildOptionCard(
            imagePath: 'https://dashboard.codeparrot.ai/api/image/Z-eZqnn5m-GBkO9V/vuesax-b-6.png',
            title: 'Reel Generation',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TextToVideoScreen())),
          ),
        ],
      ),
    );
  }
}

class GradientBoxBorder extends BoxBorder {
  final Gradient gradient;
  final double width;

  const GradientBoxBorder({required this.gradient, this.width = 1.0});

  @override
  BorderSide get bottom => BorderSide.none;

  @override
  BorderSide get top => BorderSide.none;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  bool get isUniform => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    if (shape == BoxShape.circle) {
      final center = rect.center;
      final radius = (rect.shortestSide - width) / 2;
      canvas.drawCircle(center, radius, paint);
    } else {
      final rrect = borderRadius?.toRRect(rect) ?? RRect.fromRectAndRadius(rect, Radius.zero);
      canvas.drawRRect(rrect, paint);
    }
  }

  @override
  ShapeBorder scale(double t) {
    return GradientBoxBorder(gradient: gradient, width: width * t);
  }
}

// Dummy Screens (Replace with actual screens)
class IdeaGenerationScreen extends StatelessWidget {
  const IdeaGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Idea Generation')),
      body: const Center(child: Text('Idea Generation Content')),
    );
  }
}

class PostGenerationScreen extends StatelessWidget {
  const PostGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Generation')),
      body: const Center(child: Text('Post Generation Content')),
    );
  }
}

class PromptGenerationScreen extends StatelessWidget {
  const PromptGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prompt Generation')),
      body: const Center(child: Text('Prompt Generation Content')),
    );
  }
}

class ImageGenerationScreen extends StatelessWidget {
  const ImageGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Generation')),
      body: const Center(child: Text('Image Generation Content')),
    );
  }
}

class CaptionGenerationScreen extends StatelessWidget {
  const CaptionGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Caption Generation')),
      body: const Center(child: Text('Caption Generation Content')),
    );
  }
}

class ReelGenerationScreen extends StatelessWidget {
  const ReelGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reel Generation')),
      body: const Center(child: Text('Reel Generation Content')),
    );
  }
}
