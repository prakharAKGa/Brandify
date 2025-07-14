// import 'package:brandify/components/gradient_container.dart';
// import 'package:brandify/components/navigation_buttons.dart';
// import 'package:brandify/components/onboarding_image.dart';
// import 'package:brandify/components/onboarding_text.dart';
// import 'package:brandify/components/page_indicator.dart';
// import 'package:brandify/components/social_icon.dart';
// import 'package:flutter/material.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({Key? key}) : super(key: key);

//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   int _currentPage = 0;
//   final PageController _pageController = PageController();

//   final List<Map<String, dynamic>> _pages = [
//     {
//       'image': 'assets/images/image 3 (2).svg',
//       'title': 'Welcome to the Brandify',
//       'description': '“Unlock Infinite Inspiration: Let AI Ignite Your Imagination!”',
//       'leftText': 'Skip',
//     },
//     // Add more pages as needed
//   ];

//   void _nextPage() {
//     if (_currentPage < _pages.length - 1) {
//       setState(() {
//         _currentPage++;
//         _pageController.nextPage(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       });
//     } else {
//       // Navigate to the next screen (e.g., Sign In/Sign Up)
//       Navigator.pushReplacementNamed(context, '/auth');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GradientContainer(
//         child: Stack(
//           children: [
//             OnboardingImage(svgPath: _pages[_currentPage]['image']!),
//             const SocialIcon(
//               svgPath: 'assets/images/145807 4.svg',
//               left: 23,
//               top: 143,
//               width: 36,
//               height: 36,
//             ),
//             const SocialIcon(
//               svgPath: 'assets/images/733585 3.svg',
//               left: 285,
//               top: 150,
//               width: 30,
//               height: 30,
//             ),
//             const SocialIcon(
//               svgPath: 'assets/images/3046126 1.svg',
//               left: 66,
//               top: 71,
//               width: 37,
//               height: 37,
//             ),
//             const SocialIcon(
//               svgPath: 'assets/images/5968764 1.svg',
//               left: 140,
//               top: 33,
//               width: 34,
//               height: 34,
//             ),
//             const SocialIcon(
//               svgPath: 'assets/images/8359686 1.svg',
//               left: 235,
//               top: 52,
//               width: 41,
//               height: 41,
//             ),
//             const SocialIcon(
//               svgPath: 'assets/images/10264150 3.svg',
//               left: 19,
//               top: 232.12,
//               width: 36,
//               height: 36,
//               rotation: -0.11,
//             ),
//             const SocialIcon(
//               svgPath: 'assets/images/10347203 1.svg',
//               left: 298,
//               top: 233.02,
//               width: 30,
//               height: 30,
//               rotation: -0.17,
//             ),
//             OnboardingText(
//               title: _pages[_currentPage]['title']!,
//               description: _pages[_currentPage]['description']!,
//             ),
//             PageIndicator(
//               currentPage: _currentPage,
//               pageCount: _pages.length,
//             ),
//             NavigationButtons(
//               leftText: _pages[_currentPage]['leftText']!,
//               onRightPressed: _nextPage,
//               onLeftPressed: null, // No back button on the first page
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }