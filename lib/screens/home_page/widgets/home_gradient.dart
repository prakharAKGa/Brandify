// custom_background.dart
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.radial(
      const Offset(0, 0),
      size.width * 0.002777778,
      [
        const Color(0xff9747FF).withOpacity(1),
        const Color(0xff000000).withOpacity(1),
        const Color(0xff000000).withOpacity(1),
        const Color(0xff000000).withOpacity(1),
        const Color(0xff000000).withOpacity(1),
        const Color(0xff000000).withOpacity(1),
        const Color(0xff000000).withOpacity(1),
        const Color(0xff532859).withOpacity(1),
      ],
      [0, 0.569, 0.604, 0.724, 0.769, 0.869, 0.919, 1],
    );
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.black.withOpacity(0.61);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class CustomBackground extends StatelessWidget {
  final Widget child;
  
  const CustomBackground({required this.child});
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 
              MediaQuery.of(context).size.height),
          painter: RPSCustomPainter(),
        ),
        child, // Your screen content
      ],
    );
  }
}
