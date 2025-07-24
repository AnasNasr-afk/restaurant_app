import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/components.dart';
import '../../../core/themes/color_manager.dart';
import '../../../core/themes/text_styles.dart';
import '../../menu_screen/cubit/menu_cubit.dart';

class RemoveAllButton extends StatelessWidget {

  const RemoveAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MenuCubit>();
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => showRemoveAllDialog(context, cubit),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
               Icon(
                Icons.delete_outline,
                color: ColorManager.darkRedColor,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                "Remove All",
                style: TextStyles.font12RedMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
