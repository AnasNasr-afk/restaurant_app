import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/features/login_screen/cubit/login_cubit.dart';

import '../../../core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.emailController,
            hintText: 'Email address',
            validator: (value){
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            controller: cubit.passwordController,
            hintText: 'Password',
            isObscureText:isObscured ,
            validator: (value){
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscured = !isObscured;
                });
              },
              child: Icon(
                isObscured ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
