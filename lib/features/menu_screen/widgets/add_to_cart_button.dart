// widgets/add_to_cart_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/features/cart_screen/data/cart_model.dart';
import '../../../core/themes/color_manager.dart';
import '../../../core/themes/text_styles.dart';
import '../cubit/menu_cubit.dart';
import '../cubit/menu_states.dart';
import '../data/menu_model.dart';


class AddToCartButton extends StatelessWidget {
  final MenuItem menuItem;
  final String category;

  const AddToCartButton({
    super.key,
    required this.menuItem,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuStates>(
      builder: (context, state) {
        final cubit = MenuCubit.get(context);
        final quantity = cubit.getItemQuantity(menuItem, category);
        final isInCart = quantity > 0;

        if (isInCart) {
          return _buildQuantityControls(context, cubit, quantity);
        } else {
          return _buildAddToCartButton(context, cubit);
        }
      },
    );
  }

  Widget _buildAddToCartButton(BuildContext context, MenuCubit cubit) {
    return Container(
      height: 45,
      width: 120,
      decoration: BoxDecoration(
        color: ColorManager.secondaryColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: ColorManager.secondaryColor.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () => cubit.addToCart(menuItem, category),
          child: Center(
            child: Text(
              "Add to Cart",
              style: TextStyles.font14WhiteMedium,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityControls(BuildContext context, MenuCubit cubit, int quantity) {
    return Container(
      height: 45,
      width: 120,
      decoration: BoxDecoration(
        color: ColorManager.secondaryColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: ColorManager.secondaryColor.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Minus button
          _buildControlButton(
            icon: Icons.remove,
            onTap: () => cubit.removeFromCart(menuItem.getId(category)),
          ),

          // Quantity display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              quantity.toString(),
              style: TextStyles.font16WhiteBold,
            ),
          ),

          // Plus button
          _buildControlButton(
            icon: Icons.add,
            onTap: () => cubit.addToCart(menuItem, category),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}