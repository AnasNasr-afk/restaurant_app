
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/themes/color_manager.dart';
import '../../../core/themes/text_styles.dart';
import '../../cart_screen/cart_screen.dart';
import '../../menu_screen/cubit/menu_cubit.dart';
import '../../menu_screen/cubit/menu_states.dart';


class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuStates>(
      builder: (context, state) {
        final cubit = MenuCubit.get(context);

        // Only show if there are items in cart
        if (cubit.cartItems.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorManager.secondaryColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
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
              onTap: () => _openCartScreen(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  children: [

                    Stack(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Center(
                              child: Text(
                                cubit.totalItemsCount.toString(),
                                style: TextStyle(
                                  color: ColorManager.secondaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        "View cart",
                        style: TextStyles.font16WhiteBold,
                      ),
                    ),


                    Text(
                      "\$ ${cubit.totalAmount.toStringAsFixed(2)}",
                      style: TextStyles.font16WhiteBold,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _openCartScreen(BuildContext context) {
    final cubit = MenuCubit.get(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider.value(
        value: cubit,
        child: const CartScreen(),
      ),
    );
  }
}