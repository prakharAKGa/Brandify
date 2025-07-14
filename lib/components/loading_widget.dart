import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  final String text;
  final double width;
  final double height;

  const LoadingIndicator({
    Key? key,
    this.text = 'Generating',
    this.width = 350,
    this.height = 74,
  }) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _scaleAnimations;
  late List<Animation<Color?>> _colorAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _scaleAnimations = List.generate(3, (index) {
      return Tween<double>(begin: 0.8, end: 1.4).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.2, (index * 0.2) + 0.6, curve: Curves.easeInOut),
        ),
      );
    });

    _colorAnimations = List.generate(3, (index) {
      return ColorTween(begin: const Color(0xFFDF4A80), end: const Color(0xFF8A2BE2)).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.2, (index * 0.2) + 0.6, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFDF4A80),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimations[index].value,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _colorAnimations[index].value,
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
