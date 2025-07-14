import 'package:brandify/screens/company_details/widgets/input_field.dart';
import 'package:brandify/screens/company_details/widgets/screen_navigation.dart';
import 'package:brandify/screens/company_details/widgets/title_section.dart';
import 'package:brandify/screens/company_details/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final VoidCallback nextPage;
  final int currentStep;

  const Screen2({Key? key, required this.nextPage, required this.currentStep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.50, -0.13),
              radius: 1.18,
              colors: [
                const Color(0xFF9747FF),
                Colors.black,
                Colors.black,
                Colors.black,
                Colors.black,
                Colors.black,
                Colors.black,
                const Color(0xFF522759),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top Bar
                const TopBar(
                  currentStep: 1,
                ),
                const SizedBox(height: 32),
                // Title and Subtitle
                const TitleSection(),
                const SizedBox(height: 48),
                // Input Fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: const [
                      InputField(hint: 'Brand personality'),
                      SizedBox(height: 16),
                      InputField(hint: 'Target audience'),
                      SizedBox(height: 16),
                      InputField(hint: 'Brand story....', maxLines: 2),
                      SizedBox(height: 16),
                      InputField(hint: 'Goals / objective', maxLines: 3),
                    ],
                  ),
                ),
                // Add some padding to ensure the NextButton isn't too close to the input fields
                const SizedBox(height: 48),
                // Next Button
                Padding(
                  padding: EdgeInsets.all(24),
                  child: NextButton(nextPage: nextPage),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
