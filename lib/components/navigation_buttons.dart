import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/colors.dart';

class NavigationButtons extends StatelessWidget {
  final String leftText;
  final VoidCallback onRightPressed;
  final VoidCallback? onLeftPressed;

  const NavigationButtons({
    Key? key,
    required this.leftText,
    required this.onRightPressed,
    this.onLeftPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      top: 604,
      child: SizedBox(
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: onLeftPressed,
              child: Text(
                leftText,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            ElevatedButton(
              onPressed: onRightPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonGradientEnd,
              ),
              child: SvgPicture.asset(
                'assets/images/arrow_right.svg',
                width: 24,
                height: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}