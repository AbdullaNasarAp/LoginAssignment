import 'package:flutter/material.dart';
import 'package:login/screens/login/login_screen.dart';
import 'common/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          color: AppColors.backgroundColor,
          elevation: 0,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
