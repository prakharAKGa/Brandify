import 'package:flutter/material.dart';

import '../theme/colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const PageIndicator({
    Key? key,
    required this.currentPage,
    required this.pageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 570,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(pageCount, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: currentPage == index ? 16 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: currentPage == index ? AppColors.activeDot : AppColors.inactiveDot,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }),
      ),
    );
  }
}