import 'package:flutter/material.dart';
import 'package:hiremee/shared/widgets/ThemeColor.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey), // default label color
          floatingLabelStyle: TextStyle(color: ThemeColor), // when active
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: ThemeColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
