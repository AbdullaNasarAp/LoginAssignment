import 'package:flutter/material.dart';
import '../../../common/colors.dart';
import '../../../common/sizedbox.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.isPasswordEightCharacter,
    required this.isLowercase,
    required this.isUppercase,
    required this.isSpecialCharacter,
    required this.aNumber,
  });

  final bool isPasswordEightCharacter;
  final bool isLowercase;
  final bool isUppercase;
  final bool isSpecialCharacter;
  final bool aNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            isPasswordEightCharacter
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )
                : const Text(
                    ".",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            Ksizedbox.width10,
            const Text(
              "At Least 8 characters",
              style: TextStyle(
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
        Ksizedbox.height10,
        Row(
          children: [
            isLowercase
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )
                : const Text(
                    ".",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            Ksizedbox.width10,
            const Text(
              "An lower case letter",
              style: TextStyle(
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
        Ksizedbox.height10,
        Row(
          children: [
            isUppercase
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )
                : const Text(
                    ".",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            Ksizedbox.width10,
            const Text(
              "An upper case letter",
              style: TextStyle(
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
        Ksizedbox.height10,
        Row(
          children: [
            isSpecialCharacter
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )
                : const Text(
                    ".",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            Ksizedbox.width10,
            const Text(
              "A special character",
              style: TextStyle(
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
        Ksizedbox.height10,
        Row(
          children: [
            aNumber
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 20,
                  )
                : const Text(
                    ".",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            Ksizedbox.width10,
            const Text(
              "A number",
              style: TextStyle(
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
