import 'package:flutter/material.dart';

class WelcomeBannerComponent extends StatelessWidget {
  const WelcomeBannerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          minWidth: 300,
          minHeight: 120,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.transparent,
          border: Border.all(color: const Color(0xFFDDDDDD)),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      '"Welcome to Brandify!\nCreate captivating content with ease and bring your brand to life"',
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Image.network(
                      'https://dashboard.codeparrot.ai/api/image/Z-eZqnn5m-GBkO9V/image-9.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
             Positioned(
            top: 51,
            right: 180,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFB748C7),
              ),
            ),
          ),
          Positioned(
            top: 108,
            right: 184,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFB748C7),
              ),
            ),
          ),
          Positioned(
            top: 110,
            right: 50,
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFC107),
              ),
            ),
          ),
          Positioned(
            top: 77,
            right: 190,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFC107),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 40,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFC107),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
