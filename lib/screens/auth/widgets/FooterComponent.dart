import 'package:flutter/material.dart';

class FooterComponent extends StatelessWidget {
  final String signInText;
  final String accountText;

  FooterComponent({
    this.signInText = 'Sign In',
    this.accountText = 'Already have an account ?',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            accountText,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xFFDDDDDD),
            ),
          ),
          SizedBox(width: 6),
          GestureDetector(
            onTap: () {
              // Handle sign-in action
            },
            child: Text(
              signInText,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xFFFF007A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
