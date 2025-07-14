import 'dart:io';

import 'package:flutter/material.dart';

class ColorPaletteUploader extends StatelessWidget {
  final File? colorPalette;
  final VoidCallback onTap;

  const ColorPaletteUploader({
    Key? key,
    required this.colorPalette,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFDDDDDD)),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            colorPalette != null
                ? Image.file(colorPalette!, height: 30, width: 30)
                : const Icon(Icons.add_photo_alternate, color: Colors.white),
            const Text(
              'Brand color pallate',
              style: TextStyle(
                color: Color(0xFFDDDDDD),
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}