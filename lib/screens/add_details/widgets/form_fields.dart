import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  const FormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          _buildTextField('Name'),
          const SizedBox(height: 16),
          _buildTextField('Position'),
          const SizedBox(height: 16),
          _buildTextField('Bio....'),
          const SizedBox(height: 16),
          _buildTextField('Date of birth'),
          const SizedBox(height: 16),
          _buildTextField('Interest'),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xFFDDDDDD),
          fontFamily: 'Montserrat',
          fontSize: 16,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFFDDDDDD), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFFDF4A80), width: 2),
        ),
      ),
    );
  }
}
