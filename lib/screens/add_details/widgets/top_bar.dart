import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.network(
            'https://dashboard.codeparrot.ai/api/image/Z-RDuQggqYBhYb1h/ion-arro.png',
            width: 26,
            height: 26,
          ),
        ),
      ),
    );
  }
}
