import 'package:brandify/screens/add_details/widgets/form_fields.dart';
import 'package:brandify/screens/add_details/widgets/submit_button.dart';
import 'package:brandify/screens/add_details/widgets/title_section.dart';
import 'package:brandify/screens/add_details/widgets/top_bar.dart';
import 'package:flutter/material.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
height: height,
        clipBehavior: Clip.antiAlias,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                TopBar(),
                SizedBox(height: 20),
                TitleSection(),
                SizedBox(height: 40),
                FormFields(),
                 SizedBox(height: 40),
                SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
