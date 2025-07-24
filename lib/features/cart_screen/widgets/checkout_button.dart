import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/components.dart';
import '../../../core/themes/color_manager.dart';
import '../../../core/themes/text_styles.dart';
import '../../menu_screen/cubit/menu_cubit.dart';

class CheckoutButton extends StatelessWidget {
  final String selectedTable;

  const CheckoutButton({super.key, required this.selectedTable});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: ColorManager.secondaryColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: ColorManager.secondaryColor.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () async {
                final cubit = context.read<MenuCubit>();


                showProcessingDialog(context);

                await Future.delayed(const Duration(seconds: 2));

                cubit.clearCart();
                Navigator.of(context).pop();

                await showCheckoutSuccessDialog(
                    context, selectedTable: selectedTable);
              },
              child: Center(
                child: Text(
                  "Proceed to Checkout",
                  style: TextStyles.font16WhiteBold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
