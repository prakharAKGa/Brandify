import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  final String svgPath;
  final double left;
  final double top;
  final double width;
  final double height;
  final double? rotation;

  const SocialIcon({
    Key? key,
    required this.svgPath,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    this.rotation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: rotation != null
          ? Transform.rotate(
              angle: rotation!,
              child: SvgPicture.asset(
                svgPath,
                width: width,
                height: height,
              ),
            )
          : SvgPicture.asset(
              svgPath,
              width: width,
              height: height,
            ),
    );
  }
}