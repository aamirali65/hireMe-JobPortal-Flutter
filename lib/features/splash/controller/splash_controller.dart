// features/splash/controllers/splash_controller.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashController {
  final BuildContext context;

  SplashController(this.context);

  Future<void> checkAuthStatus() async {
    print('[Splash] waiting for session restore...');
    await Future.delayed(const Duration(seconds: 2));

    final session = Supabase.instance.client.auth.currentSession;
    final user = Supabase.instance.client.auth.currentUser;

    print('[Splash] session: $session, user: $user');

    if (user != null) {
      context.go('/onboarding');
    } else {
      context.go('/loginGoogle');
    }
  }

}
