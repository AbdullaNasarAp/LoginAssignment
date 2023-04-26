import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login/screens/login/widgets/custom_textformfied.dart';
import 'package:login/screens/login/widgets/password_validation.dart';

import '../../common/colors.dart';
import '../../common/sizedbox.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visibilityClicked = true;
  bool isPasswordEightCharacter = false;
  bool isLowercase = false;
  bool isUppercase = false;
  bool isSpecialCharacter = false;
  bool aNumber = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController conformPassword = TextEditingController();
  final GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () {},
          child: const Text(
            'Back',
            style: TextStyle(color: AppColors.themeColor, fontSize: 16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formGlobalKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFeld(
                title: 'Email',
                hintText: 'example@gmail.com',
                keyboardType: TextInputType.emailAddress,
                controller: email,
              ),
              Ksizedbox.height30,
              CustomTextFeld(
                onChanged: (p0) => onChangedPass(p0),
                title: 'New Password',
                hintText: 'Choose a secure password',
                obscureText: visibilityClicked,
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      visibilityClicked = !visibilityClicked;
                    });

                    log(
                      visibilityClicked.toString(),
                    );
                  },
                  child: Icon(
                    visibilityClicked ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.themeColor,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                controller: password,
              ),
              Ksizedbox.height30,
              CustomTextFeld(
                title: 'Re-enter New Password',
                hintText: 'Choose a secure password',
                obscureText: visibilityClicked,
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      visibilityClicked = !visibilityClicked;
                    });
                  },
                  child: Icon(
                    visibilityClicked ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFFb69278),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                controller: conformPassword,
              ),
              Ksizedbox.height20,
              const Text(
                'Your password must contain:',
                style: TextStyle(
                  color: AppColors.textColor,
                ),
              ),
              Ksizedbox.height20,
              PasswordValidation(
                isPasswordEightCharacter: isPasswordEightCharacter,
                isLowercase: isLowercase,
                isUppercase: isUppercase,
                isSpecialCharacter: isSpecialCharacter,
                aNumber: aNumber,
              ),
              Ksizedbox.height30,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: AppColors.themeColor,
                  foregroundColor: AppColors.backgroundColor,
                ),
                onPressed: () {
                  setState(() {
                    if (formGlobalKey.currentState!.validate()) {
                      formGlobalKey.currentState!.save();
                      singIn();
                    }
                  });
                },
                child: const Text(
                  'Create account',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onChangedPass(String password) {
    setState(() {
      isPasswordEightCharacter = false;
      if (password.length >= 8) {
        isPasswordEightCharacter = true;
      }
      bool containsLowercase = RegExp("[a-z]").hasMatch(password);
      isLowercase = false;
      if (containsLowercase) {
        isLowercase = true;
      }
      bool containsUppercase = RegExp("[A-Z]").hasMatch(password);
      isUppercase = false;
      if (containsUppercase) {
        isUppercase = true;
      }
      bool containsSpecialChar =
          RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
      isSpecialCharacter = false;
      if (containsSpecialChar) {
        isSpecialCharacter = true;
      }
      bool containsNumber = RegExp(r'\d').hasMatch(password);
      aNumber = false;
      if (containsNumber) {
        aNumber = true;
      }
    });
  }

  void singIn() {
    if (password.text == conformPassword.text &&
        isPasswordEightCharacter == true &&
        isLowercase == true &&
        isUppercase == true &&
        isSpecialCharacter == true &&
        aNumber == true &&
        email.text.isNotEmpty) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ),
        (route) => false,
      );
    } else {
      const snackBar = SnackBar(
        content: Text('incorrect input'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      log("incorrect input");
    }
  }
}
