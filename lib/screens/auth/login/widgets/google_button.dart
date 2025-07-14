import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFFBFBFB),
        border: Border.all(color: const Color(0xFFDDDDDD)),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://dashboard.codeparrot.ai/api/image/Z-Q_xh_Ow-G566mK/flat-col.png',
              width: 28,
              height: 28,
            ),
            const SizedBox(width: 9),
            const Text(
              'Login with Google',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.32,
                color: Color(0xFF2D2D39),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
