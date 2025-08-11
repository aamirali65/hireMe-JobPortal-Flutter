import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiremee/shared/dialogs/confirm_dialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../widgets/auth_form.dart';
import '../widgets/auth_layout.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  Future<void> _registerUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final supabase = Supabase.instance.client;

    if (password != confirmPassword) {
      await showCupertinoMessageDialog(
        context,
        title: "Error",
        message: "Passwords do not match.",
      );
      return;
    }

    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw "Registration failed";
      }

      await supabase.from('users').insert({
        'id': response.user!.id,
        'email': email,
        'name': name,
        'phone': null,
        'address': null,
        'pfp': null,
      });

      await showCupertinoMessageDialog(
        context,
        title: "Success",
        message: "Profile created successfully. You can now login.",
        onPressed: () {
          context.go('/login');
        },
      );
    } catch (e) {
      await showCupertinoMessageDialog(
        context,
        title: "Error",
        message: e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      isLogin: false,
      onGoogleSignIn: () {}, // disabled for now
      onFacebookSignIn: () {}, // disabled for now
      form: AuthForm(
        isLogin: false,
        onSubmit: ({
          required String name,
          required String email,
          required String password,
          required String confirmPassword,
        }) async {
          await _registerUser(
            context: context,
            name: name,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          );
        },
        onToggleForm: () => context.go('/login'),
        onGoogleSignIn: () {},
      ),
    );
  }
}

