import 'package:flutter/material.dart';

class InputFieldsComponent extends StatelessWidget {
  const InputFieldsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildInputField(
            icon: 'https://dashboard.codeparrot.ai/api/image/Z-Q34x_Ow-G566mE/input-fi.png',
            hintText: 'Name',
          ),
          SizedBox(height: 20),
          _buildInputField(
            icon: 'https://dashboard.codeparrot.ai/api/image/Z-Q34x_Ow-G566mE/xnix-lin.png',
            hintText: 'Email',
          ),
          SizedBox(height: 20),
          _buildInputField(
            icon: 'https://dashboard.codeparrot.ai/api/image/Z-Q34x_Ow-G566mE/xnix-lin-2.png',
            hintText: 'Password',
            isPassword: true,
          ),
          SizedBox(height: 20),
          _buildInputField(
            icon: 'https://dashboard.codeparrot.ai/api/image/Z-Q34x_Ow-G566mE/xnix-lin-3.png',
            hintText: 'Confirm password',
            isPassword: true,
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String icon,
    required String hintText,
    bool isPassword = false,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Color(0xFFDDDDDD),
          width: 1,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF151515),
            Color(0xFF1E1E1E),
          ],
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Image.network(
              icon,
              width: 24,
              height: 24,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              obscureText: isPassword,
              style: TextStyle(
                color: Color(0xFFDDDDDD),
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xFFDDDDDD),
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

