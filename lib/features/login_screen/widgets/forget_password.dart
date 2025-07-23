import 'package:flutter/material.dart';

import '../../../core/themes/text_styles.dart';
import '../cubit/login_cubit.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          LoginCubit.get(context).forgotPassword(context);
        },
        child:  Text("Forgot Password?" ,
          style: TextStyles.font16BlackRegular,
        ),
      ),
    );
  }
}
