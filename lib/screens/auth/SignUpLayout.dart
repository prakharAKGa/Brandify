import 'package:brandify/screens/auth/widgets/ButtonsComponent.dart';
import 'package:brandify/screens/auth/widgets/FooterComponent.dart';
import 'package:brandify/screens/auth/widgets/HeaderComponent.dart';
import 'package:brandify/screens/auth/widgets/InputFieldsComponent.dart';
import 'package:brandify/screens/auth/widgets/TermsComponent.dart';
import 'package:flutter/material.dart';

class SignUpLayout extends StatefulWidget {
  @override
  State<SignUpLayout> createState() => _SignUpLayoutState();
}

class _SignUpLayoutState extends State<SignUpLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          clipBehavior: Clip.antiAlias,
decoration: BoxDecoration(
gradient: RadialGradient(
center: Alignment(0.50, -0.13),
radius: 1.18,
colors: [const Color(0xFF9747FF), Colors.black, Colors.black, Colors.black, Colors.black, Colors.black, Colors.black, const Color(0xFF522759)],
),
),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40), // Add some top padding
              HeaderComponent(),
              const SizedBox(height: 20),
              InputFieldsComponent(),
              const SizedBox(height: 20),
              TermsComponent(),
              const SizedBox(height: 20),
              ButtonsComponent(),
              const SizedBox(height: 20),
              FooterComponent(),
              const SizedBox(height: 40), // Add some bottom padding
            ],
          ),
        ),
      ),
    );
  }
}