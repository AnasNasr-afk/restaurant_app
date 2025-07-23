import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/features/login_screen/cubit/login_states.dart';
import 'package:restaurant_app/core/widgets/app_text_button.dart';

import '../../../core/components/components.dart';
import '../../../core/routes/routes.dart';
import '../../../core/themes/text_styles.dart';
import '../cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit , LoginStates>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showAppLoadingDialog(context);
        }

        if (state is LoginSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Routes.menuScreen);
        }

        if (state is LoginErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid email or password, please try again."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) =>  AppTextButton(
          onPressed: (){
            cubit.userLogin(context);
          },
          text: Text(
            'Login',
            style: TextStyles.font20WhiteBold,
          )
      ),

    );
  }
}
