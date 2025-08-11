import 'package:flutter/material.dart';
import 'package:hiremee/shared/widgets/ThemeColor.dart';
import 'package:hiremee/shared/widgets/custom_text.dart';
import 'package:hiremee/shared/widgets/input_field.dart';

class AuthForm extends StatefulWidget {
  final bool isLogin;
  final Future<void> Function({
  required String name,
  required String email,
  required String password,
  required String confirmPassword,
  }) onSubmit;
  final VoidCallback onToggleForm;
  final VoidCallback onGoogleSignIn;

  const AuthForm({
    super.key,
    required this.isLogin,
    required this.onSubmit,
    required this.onToggleForm,
    required this.onGoogleSignIn,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _isLoading = false;

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() => _isLoading = true);

    try {
      await widget.onSubmit(
        name: _name,
        email: _email,
        password: _password,
        confirmPassword: _confirmPassword,
      );
    } catch (e) {
      debugPrint("Auth error: $e");
    }

    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final buttonText = widget.isLogin ? 'Login' : 'Register';

    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (!widget.isLogin)
            CustomTextField(
              label: "Name",
              validator: (value) => value!.isEmpty ? 'Enter your name' : null,
              onSaved: (value) => _name = value!.trim(),
            ),
          CustomTextField(
            label: "Email",
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
            value == null || !value.contains('@') ? 'Invalid email' : null,
            onSaved: (value) => _email = value!.trim(),
          ),
          CustomTextField(
            label: "Password",
            obscureText: !_showPassword,
            validator: (value) =>
            value != null && value.length >= 6 ? null : 'Password too short',
            onSaved: (value) => _password = value!.trim(),
            suffixIcon: IconButton(
              icon: Icon(
                _showPassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            ),
          ),
          if (!widget.isLogin)
            CustomTextField(
              label: "Confirm Password",
              obscureText: !_showConfirmPassword,
              validator: (value) =>
              value != null && value.length >= 6 ? null : 'Confirm your password',
              onSaved: (value) => _confirmPassword = value!.trim(),
              suffixIcon: IconButton(
                icon: Icon(
                  _showConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _showConfirmPassword = !_showConfirmPassword;
                  });
                },
              ),
            ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _isLoading ? null : _submit,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _isLoading ? Colors.grey : ThemeColor,
              ),
              child: Center(
                child: _isLoading
                    ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                    : MyText(
                  text: buttonText,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
