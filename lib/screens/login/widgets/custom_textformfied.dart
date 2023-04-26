import 'package:flutter/material.dart';

import '../../../common/colors.dart';
import '../../../common/sizedbox.dart';

class CustomTextFeld extends StatelessWidget {
  const CustomTextFeld({
    super.key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.suffix,
    this.validator,
    this.onChanged,
    required this.keyboardType,
    required this.controller,
  });
  final String title;
  final String hintText;
  final bool obscureText;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textColor,
          ),
        ),
        Ksizedbox.height10,
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: validator,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            filled: true,
            fillColor: const Color(0xFF2d4051),
            border: InputBorder.none,
            hintStyle: const TextStyle(
              color: Colors.white54,
            ),
            hintText: hintText,
            suffix: suffix,
          ),
          obscureText: obscureText,
        ),
      ],
    );
  }
}
