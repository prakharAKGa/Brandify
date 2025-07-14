import 'package:flutter/material.dart';

class ButtonsComponent extends StatelessWidget {
  final double width;
  final double height;

  const ButtonsComponent({
    Key? key,
    this.width = 400,
    this.height = 52,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        children: [
          // Primary Button
          Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFDF4A80),
                  Color(0xFFD049A3),
                  Color(0xFFC249B3),
                  Color(0xFFB748C7),
                  Color(0xFFBA51DC),
                  Color(0xFFA748E2),
                  Color(0xFF9747FF),
                ],
                stops: [0.0, 0.0377, 0.1935, 0.3249, 0.4679, 0.6064, 1.0816],
              ),
            ),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text(
                'Create your account',
                style: TextStyle(
                  color: Color(0xFFFBFBFB),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          // Google Button
          Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              color: Color(0xFFFBFBFB),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xFFDDDDDD),
                width: 1,
              ),
            ),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://dashboard.codeparrot.ai/api/image/Z-Q34x_Ow-G566mE/flat-col.png',
                    width: 28,
                    height: 28,
                  ),
                  SizedBox(width: 9),
                  Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: Color(0xFF2D2D39),
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.32,
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

