import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final int maxLines;

  const InputField({
    Key? key,
    required this.hint,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFDDDDDD)),
      ),
      child: TextField(
        style: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          color: Color(0xFFFBFBFB),
        ),
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 13,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            color: Color(0xFFDDDDDD),
          ),
        ),
      ),
    );
  }
}