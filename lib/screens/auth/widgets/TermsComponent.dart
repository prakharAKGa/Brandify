import 'package:flutter/material.dart';

class TermsComponent extends StatefulWidget {
  @override
  _TermsComponentState createState() => _TermsComponentState();
}

class _TermsComponentState extends State<TermsComponent> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 300,
      ),
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFDDDDDD),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
                color: isChecked ? Color(0xFFDDDDDD).withOpacity(0.1) : Colors.transparent,
              ),
              child: isChecked
                  ? Icon(
                      Icons.check,
                      size: 12,
                      color: Color(0xFFDDDDDD),
                    )
                  : null,
            ),
          ),
          SizedBox(width: 8),
          Flexible(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  letterSpacing: 0.14,
                  color: Color(0xFFDDDDDD),
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(text: 'I agree to the '),
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

