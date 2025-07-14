import 'package:brandify/screens/home_page/widgets/Generating_options.dart';
import 'package:brandify/screens/home_page/widgets/header_wiget.dart';
import 'package:brandify/screens/home_page/widgets/home_gradient.dart';
import 'package:brandify/screens/home_page/widgets/welcome_banner.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              const HeaderComponent(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const WelcomeBannerComponent(),
                      const GenerationOptionsComponent(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
