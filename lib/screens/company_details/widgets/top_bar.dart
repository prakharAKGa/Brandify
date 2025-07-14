import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  final int currentStep;

  const TopBar({Key? key, required this.currentStep}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == widget.currentStep ? Colors.pinkAccent : Colors.grey[300],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
