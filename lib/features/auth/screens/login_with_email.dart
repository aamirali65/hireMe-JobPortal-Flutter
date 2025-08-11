import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiremee/shared/widgets/ThemeColor.dart';
import 'package:hiremee/shared/widgets/custom_text.dart';

class LoginWithGoogle extends StatefulWidget {
  const LoginWithGoogle({super.key});

  @override
  State<LoginWithGoogle> createState() => _LoginWithGoogleState();
}

class _LoginWithGoogleState extends State<LoginWithGoogle> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Image.asset(
                "assets/images/logo.png",
                width: screenWidth * 0.25, // responsive logo width
              ),
              MyText(
                text: "HireMe",
                color: Colors.black87,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: screenHeight * 0.04),
              MyText(
                text: "Let's get started!",
                color: Colors.black54,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: screenHeight * 0.05),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/facebook.png", width: 30),
                      const SizedBox(width: 10),
                      MyText(
                        text: "Continue with Facebook",
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/google.png", width: 30),
                      const SizedBox(width: 10),
                      MyText(
                        text: "Continue with Google",
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.025),
              GestureDetector(
                onTap: () {
                  context.go('/login');
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeColor,
                  ),
                  child: Center(
                    child: MyText(
                      text: "Sign in with email",
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: "Don't have an account",
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/register');
                    },
                    child: MyText(
                      text: "Sign up",
                      color: ThemeColor,
                      fontSize: 20,
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
