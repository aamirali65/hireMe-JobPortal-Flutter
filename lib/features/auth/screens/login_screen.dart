import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiremee/shared/dialogs/confirm_dialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../widgets/auth_form.dart';
import '../widgets/auth_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<void> _login(
      BuildContext context, String email, String password) async {
    final supabase = Supabase.instance.client;

    try {
      final res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (res.user == null) throw "Invalid email or password";

      await showCupertinoMessageDialog(
        context,
        title: "Welcome",
        message: "Login successful!",
        onPressed: () {
          context.go('/onboarding');
        },
      );
    } catch (e) {
      await showCupertinoMessageDialog(
        context,
        title: "Login Failed",
        message: e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      isLogin: true,
      onGoogleSignIn: () {},
      onFacebookSignIn: () {},
      form: AuthForm(
        isLogin: true,
        onSubmit: ({
          required String name,
          required String email,
          required String password,
          required String confirmPassword,
        }) async {
          await _login(context, email, password);
        },
        onToggleForm: () => context.go('/register'),
        onGoogleSignIn: () {},
      ),
    );
  }
}

