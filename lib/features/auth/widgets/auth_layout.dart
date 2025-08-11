import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremee/shared/widgets/ThemeColor.dart';
import 'package:hiremee/shared/widgets/custom_text.dart';

class AuthLayout extends StatelessWidget {
  final Widget form;
  final VoidCallback onGoogleSignIn;
  final VoidCallback onFacebookSignIn;
  final bool isLogin;

  const AuthLayout({
    super.key,
    required this.form,
    required this.onGoogleSignIn,
    required this.onFacebookSignIn,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white38,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Image.asset("assets/images/logo.png", width: screenWidth * 0.25),
              MyText(
                text: "HireMe",
                color: Colors.black87,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: screenHeight * 0.02),
              MyText(
                text: isLogin ? "Login to Your Account" : "Register Now!",
                color: Colors.grey.shade800,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: screenHeight * 0.02),
              form,
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  const Expanded(
                    child: Divider(thickness: 1, color: Colors.grey, endIndent: 10),
                  ),
                  Text(
                    'OR',
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(
                    child: Divider(thickness: 1, color: Colors.grey, indent: 10),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/google.png", width: 30),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/facebook.png", width: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),

              // Toggle login/register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: isLogin ? "Don't have an account?" : "Already have an account?",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(isLogin ? '/register' : '/loginGoogle');
                    },
                    child: MyText(
                      text: isLogin ? "Sign up" : "Login",
                      color: ThemeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
