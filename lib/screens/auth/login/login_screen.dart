import 'package:brandify/screens/auth/login/widgets/forgot_password.dart';
import 'package:brandify/screens/auth/login/widgets/google_button.dart';
import 'package:brandify/screens/auth/login/widgets/gradient.dart';
import 'package:brandify/screens/auth/login/widgets/header.dart';
import 'package:brandify/screens/auth/login/widgets/input_field.dart';
import 'package:brandify/screens/auth/login/widgets/login_button.dart';
import 'package:brandify/screens/auth/login/widgets/sign_up_prompt.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Stack(
        children: [
          // Add the background as the first layer
          const GradientBackground(),
          
          // Your existing content
          SizedBox(
            height: height,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 116),
                      const Header(),
                      const SizedBox(height: 64),
                      
                      // Email Input Field with Network Icon
                      const InputField(
                        iconUrl: 'https://dashboard.codeparrot.ai/api/image/Z-Q_xh_Ow-G566mK/xnix-lin.png',
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 20),
                      
                      // Password Input Field with Network Icon
                      const InputField(
                        iconUrl: 'https://dashboard.codeparrot.ai/api/image/Z-Q_xh_Ow-G566mK/xnix-lin-2.png',
                        hintText: 'Password',
                      ),
                      
                      const ForgotPassword(),
                      const SizedBox(height: 20),
                      
                      // Login & Social Login Buttons
                      const LoginButton(),
                      const SizedBox(height: 12),
                      const GoogleButton(),
                      const SizedBox(height: 40),
                      
                      // Sign Up Prompt
                      const SignUpPrompt(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}