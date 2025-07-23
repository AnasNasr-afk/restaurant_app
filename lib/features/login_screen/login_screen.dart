import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/core/themes/color_manager.dart';
import 'package:restaurant_app/features/login_screen/widgets/email_and_password.dart';
import 'package:restaurant_app/features/login_screen/widgets/forget_password.dart';
import 'package:restaurant_app/features/login_screen/widgets/intro_login_text.dart';
import 'package:restaurant_app/features/login_screen/widgets/login_button.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                const IntroLoginText(),
                SizedBox(height: 80.h),
                const EmailAndPassword(),
                SizedBox(height: 10.h),
                ForgetPassword(),
                SizedBox(height: 10.h),
                const LoginButton(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
