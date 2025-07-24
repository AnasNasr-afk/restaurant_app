import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/core/components/components.dart';

import '../../../core/themes/color_manager.dart';
import '../../../core/themes/text_styles.dart';
import '../../menu_screen/cubit/menu_cubit.dart';
import '../data/cart_model.dart';


class CartItemCard extends StatelessWidget {
  final CartItem? item;
  const CartItemCard({super.key, this.item});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Item image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                item!.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.fastfood, color: Colors.grey),
                ),
              ),
            ),
          ),

          const SizedBox(width: 15),

          // Item details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item!.name,
                  style: TextStyles.font16BlackMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  "\$${item!.price}",
                  style: TextStyles.font14SecondaryColorMedium,
                ),
              ],
            ),
          ),

          // Quantity controls
          Builder(
            builder: (context) {
              final cubit = context.read<MenuCubit>();
              return _buildQuantityControls(cubit, item!);
            },
          ),
        ],
      ),
    );
  }
}

Widget buildOrderDetails(List<CartItem> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Order Details",
        style: TextStyles.font18BrownSemiBold,
      ),
      const SizedBox(height: 15),
      ...items.map((item) => CartItemCard(item: item,)),
    ],
  );
}

Widget _buildQuantityControls(MenuCubit cubit, CartItem item) {
  return Container(
    decoration: BoxDecoration(
      color: ColorManager.backgroundColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildQuantityButton(
          icon: Icons.remove,
          onTap: () => cubit.removeFromCart(item.id),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            item.quantity.toString(),
            style: TextStyles.font14BlackMedium,
          ),
        ),
        _buildQuantityButton(
          icon: Icons.add,
          onTap: () => cubit.addToCart(item.toMenuItem(), item.category),
        ),
      ],
    ),
  );
}

Widget _buildQuantityButton({
  required IconData icon,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: ColorManager.secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 16,
      ),
    ),
  );
}