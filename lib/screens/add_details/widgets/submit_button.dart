import 'package:brandify/screens/add_details/add_details.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Container(
        width: double.infinity,
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
        child: ElevatedButton(
          onPressed: () {
               Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DetailsScreen()),
        );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: const Text(
            'Log In',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFBFBFB),
            ),
          ),
        ),
      ),
    );
  }
}
