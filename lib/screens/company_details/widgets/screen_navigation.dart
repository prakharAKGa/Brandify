import 'package:brandify/screens/company_details/company_details_screen1.dart';
import 'package:brandify/screens/company_details/company_details_screen2.dart';
import 'package:brandify/screens/company_details/company_details_screen3.dart';
import 'package:flutter/material.dart';

class ScreenNavigations extends StatefulWidget {
  const ScreenNavigations({Key? key}) : super(key: key);

  @override
  _ScreenNavigationsState createState() => _ScreenNavigationsState();
}

class _ScreenNavigationsState extends State<ScreenNavigations> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  void _nextPage() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Prevent manual swipe
        children: [
          Screen1(nextPage: _nextPage, currentStep: _currentStep),
          Screen2(nextPage: _nextPage, currentStep: _currentStep),
          Screen3(currentStep: _currentStep),
        ],
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  final VoidCallback nextPage;
  const NextButton({Key? key, required this.nextPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 52,
       decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFDF4A80),
                  Color(0xFFD049B9),
                  Color(0xFFC249B3),
                  Color(0xFFB748C7),
                  Color(0xFFBA51DC),
                  Color(0xFFA748E2),
                  Color(0xFF9747FF),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(24)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: nextPage,
          child: const Center(
            child: Text(
              'Next',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
