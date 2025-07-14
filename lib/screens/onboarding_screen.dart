import 'package:brandify/screens/introduction/screen_four.dart';
import 'package:brandify/screens/introduction/screen_one.dart';
import 'package:brandify/screens/introduction/screen_three.dart';
import 'package:brandify/screens/introduction/screen_two.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: const [
              ScreenOne(),
              ScreenTwo(),
              ScreenThree(),
            
            ],
          ),
          // Page Indicator Dots
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  width: _currentIndex == index ? 20 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? const Color(0xFF9747FF)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
          // Back/Skip Button
          Positioned(
            bottom: 130,
            left: 20,
            child: TextButton(
              onPressed: () {
                if (_currentIndex > 0) {
                  _controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // Handle Skip action (e.g., navigate to main screen)
                }
              },
              child: Text(
                _currentIndex == 0 ? "Skip" : "Back",
                style: TextStyle(
color: const Color(0xFFDF4A80),
fontSize: 16,
fontFamily: 'Montserrat',
fontWeight: FontWeight.w600,
height: 1.50,
),
              ),
            ),
          ),
          // Next/Get Started Button
          Positioned(
  bottom: 130, // Adjusted to match the UI
  right: 20,
  child: _currentIndex < 2
      ? GestureDetector(
          onTap: () {
            _controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
            width: 52,
            height: 52,
            decoration: const ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.08, 0.23),
                end: Alignment(0.88, 0.74),
                colors: [Color(0xFFC949A7), Color(0xFF9747FF)],
              ),
              shape: OvalBorder(),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
        )
      : GestureDetector(
          onTap: () {
            // Navigate to main page
      
   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ScreenFour()),
  );

          },
          child:  Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFDF4A80),
                              Color(0xFFD049B3),
                              Color(0xFFC249B3),
                              Color(0xFFB748C7),
                              Color(0xFFBA51DC),
                              Color(0xFFA748E2),
                              Color(0xFF9747FF),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                                  
   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ScreenFour()),
  );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: const Text(
                            'Get started',
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
),
        ],
      ),
    );
  }
}