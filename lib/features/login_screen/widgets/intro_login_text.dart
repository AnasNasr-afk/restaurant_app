import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/text_styles.dart';

class IntroLoginText extends StatelessWidget {
  const IntroLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text('Welcome Back!',
            style: TextStyles.font28BrownBold,
          ),
          SizedBox(height: 10.h),
          Text(
            'Please login with your account',
            style: TextStyles.font16BrownNormal,
          ),
        ],
      ),
    );
  }
}
