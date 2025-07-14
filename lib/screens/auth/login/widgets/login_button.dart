import 'package:brandify/screens/company_details/widgets/screen_navigation.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    MaterialPageRoute(builder: (context) =>  ScreenNavigations()),
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
    );
  }
}
