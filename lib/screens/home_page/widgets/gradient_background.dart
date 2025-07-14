import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.50, -0.13),
              radius: 1.18,
              colors: [
                const Color(0xFF9747FF),
                Colors.black,
                Colors.black,
                Colors.black,
                Colors.black,
                Colors.black,
                Colors.black,
                const Color(0xFF522759),
              ],
            ),
          ),
      child: child,
    );
  }
}
