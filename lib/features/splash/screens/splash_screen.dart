// features/splash/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:hiremee/features/splash/controller/splash_controller.dart';
import 'package:hiremee/shared/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SplashController(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.checkAuthStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png",width: 100,),
            MyText(text: "HireMe", color: Colors.black87, fontSize: 30, fontWeight: FontWeight.w600)
          ],
        ),
      ),
    );
  }
}
