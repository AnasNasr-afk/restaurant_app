import 'package:flutter/material.dart';

import '../../../core/themes/color_manager.dart';
import '../../../core/themes/text_styles.dart';


class HeaderContent extends StatelessWidget {
  const HeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        children: [
          // Restaurant logo
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorManager.secondaryColor, width: 3),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.secondaryColor.withValues(alpha: 0.4),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/images/meatLogo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          Text("STEAKHOUSE", style: TextStyles.font26WhiteBold),


          const SizedBox(height: 35),

          Text(
            "Our Premium Menu",
            style: TextStyles.font18SecondaryColorMedium,
          ),
        ],
      ),
    );
  }
}
