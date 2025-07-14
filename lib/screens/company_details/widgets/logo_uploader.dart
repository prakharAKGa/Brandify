import 'dart:io';

import 'package:flutter/material.dart';

class LogoUploader extends StatelessWidget {
  final String label;
  final File? image;
  final VoidCallback onTap;

  const LogoUploader({
    Key? key,
    required this.label,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 140,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFDDDDDD)),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            image != null
                ? Image.file(image!, height: 24, width: 24)
                : const Icon(Icons.add_photo_alternate, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFFDDDDDD),
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
            ),
          ],
  
        ),
      ),
    );
  }
}