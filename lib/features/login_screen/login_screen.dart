import 'package:flutter/material.dart';
import 'package:restaurant_app/core/themes/color_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorManager.backgroundColor,
        title: const Text('Login Screen'),
      ),

    );
  }
}
