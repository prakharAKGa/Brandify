import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingImage extends StatelessWidget {
  final String svgPath;

  const OnboardingImage({Key? key, required this.svgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 4,
      top: 95,
      child: SvgPicture.asset(
        svgPath,
        width: 351.45,
        height: 333,
      ),
    );
  }
}