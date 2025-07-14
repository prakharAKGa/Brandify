import 'package:flutter/material.dart';

class OnboardingText extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingText({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 13,
          top: 446,
          child: SizedBox(
            width: 334,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        Positioned(
          left: 32,
          top: 526,
          child: SizedBox(
            width: 296,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }
}