import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../features/cart_screen/data/cart_model.dart';
import '../../features/menu_screen/cubit/menu_cubit.dart';
import '../../features/menu_screen/data/menu_model.dart';
import '../themes/color_manager.dart';
import '../themes/text_styles.dart';

void showAppLoadingDialog(
    BuildContext context, {
      Color color = ColorManager.darkRedColor,
      double? size,
    }) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Center(
      child: LoadingAnimationWidget.inkDrop(
        color: color,
        size: size ?? 55,
      ),
    ),
  );
}

Widget supportPole() {
  return Container(
    width: 4,
    height: 50,
    decoration: BoxDecoration(
      color: ColorManager.brownColor,
      borderRadius: BorderRadius.circular(2),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.3),
          blurRadius: 4,
          offset: const Offset(2, 0),
        ),
      ],
    ),
  );
}


Widget buildMenuItemIcon(String itemName, {double size = 40, Color? color}) {
  return Icon(
    getIconForItem(itemName),
    size: size,
    color: color ?? ColorManager.secondaryColor.withValues(alpha: 0.8),
  );
}

IconData getIconForItem(String name) {
  final lower = name.toLowerCase();
  if (lower.contains('ribeye') || lower.contains('steak')) {
    return Icons.restaurant;
  } else if (lower.contains('shrimp') || lower.contains('calamari')) {
    return Icons.set_meal;
  } else if (lower.contains('truffle') || lower.contains('fries')) {
    return Icons.local_dining;
  } else if (lower.contains('chocolate') || lower.contains('cheesecake')) {
    return Icons.cake;
  } else if (lower.contains('juice') || lower.contains('soda')) {
    return Icons.local_drink;
  }
  return Icons.restaurant_menu;
}

Widget buildPopularBadge(bool isPopular) {
  if (!isPopular) return const SizedBox.shrink();

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: ColorManager.secondaryColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Text(
      "POPULAR",
      style: TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

void showRemoveAllDialog(BuildContext context, MenuCubit cubit) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        "Remove All Items",
        style: TextStyles.font18BrownSemiBold,
      ),
      content: Text(
        "Are you sure you want to remove all items from your cart?",
        style: TextStyles.font16BlackMedium,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: TextStyles.font16GreyMedium,
          ),
        ),
        TextButton(
          onPressed: () {
            cubit.clearCart();
            Navigator.pop(context); // Close dialog
            Navigator.pop(context); // Close cart screen
          },
          child: Text(
            "Remove All",
            style: TextStyles.font16RedMedium,
          ),
        ),
      ],
    ),
  );
}

extension CartItemExtension on CartItem {
  MenuItem toMenuItem() {
    return MenuItem(
      name: name,
      description: description,
      price: price,
      rating: 5, // Default rating since we don't store it
      popular: false, // Default popular since we don't store it
      imageUrl: imageUrl,
    );
  }
}


Widget buildEmptyCart() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.shopping_cart_outlined,
          size: 80,
          color: Colors.grey[400],
        ),
        const SizedBox(height: 20),
        Text(
          "Your cart is empty",
          style: TextStyles.font18BrownSemiBold,
        ),
        const SizedBox(height: 10),
        Text(
          "Add some delicious items to get started",
          style: TextStyles.font14GreyMedium,
        ),
      ],
    ),
  );
}

Widget buildTableNumber({
  required String selectedTable,
  required List<String> tableOptions,
  required ValueChanged<String?> onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Table Number",
        style: TextStyles.font18BrownSemiBold,
      ),
      const SizedBox(height: 10),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: ColorManager.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        child: DropdownButtonHideUnderline(

          child: DropdownButton<String>(
            dropdownColor: ColorManager.backgroundColor,
            isExpanded: true,
            value: selectedTable,
            icon: const Icon(Icons.arrow_drop_down),
            items: tableOptions
                .map(
                  (table) => DropdownMenuItem<String>(

                value: table,
                child: Row(
                  children: [
                    const Icon(Icons.table_restaurant, color: Colors.grey),
                    const SizedBox(width: 10),
                    Text(
                      table,
                      style: TextStyles.font16BlackMedium,
                    ),
                  ],
                ),
              ),
            )
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    ],
  );
}



Widget buildPaymentDetails(MenuCubit cubit) {
  final subtotal = cubit.totalAmount;
  const tax = 0.0; // You can calculate tax if needed
  const deliveryFee = 0.0;
  final total = subtotal + tax + deliveryFee;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Payment Details",
        style: TextStyles.font18BrownSemiBold,
      ),
      const SizedBox(height: 15),
      buildPaymentRow("Subtotal", subtotal),
      buildPaymentRow("Tax", tax),
      buildPaymentRow("Total", total, isTotal: true),
    ],
  );
}

Widget buildPaymentRow(String label, double amount, {bool isTotal = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal ? TextStyles.font16BlackBold : TextStyles.font14BlackMedium,
        ),
        Text(
          "\$${amount.toStringAsFixed(2)}",
          style: isTotal ? TextStyles.font16BlackBold : TextStyles.font14BlackMedium,
        ),
      ],
    ),
  );
}

void showProcessingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ColorManager.secondaryColor),
                strokeWidth: 3,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Processing your order...",
              style: TextStyles.font16BlackMedium,
            ),
          ],
        ),
      ),
    ),
  );
}


Future<void> showCheckoutSuccessDialog(
    BuildContext context, {
      required String selectedTable,
    }) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Success Animation Container
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer ring animation
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    // Success icon
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Success Title
               Text(
                "Order Placed Successfully!",
                textAlign: TextAlign.center,
                style: TextStyles.font24BrownBold,
              ),

              const SizedBox(height: 12),

              // Success Message
              Container(
                padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.table_restaurant,
                          color: ColorManager.secondaryColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          selectedTable,
                          style: TextStyles.font16SecondaryColorSemiBold,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Your delicious order is being prepared!\nPlease proceed to the cashier for payment.",
                      textAlign: TextAlign.center,
                      style: TextStyles.font14GreyMedium,

                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Order Details Row
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: ColorManager.secondaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDetailItem(
                      icon: Icons.access_time,
                      label: "Est. Time",
                      value: "15-20 min",
                      color: ColorManager.secondaryColor,
                    ),
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.grey.withValues(alpha: 0.3),
                    ),
                    _buildDetailItem(
                      icon: Icons.payment,
                      label: "Status",
                      value: "Awaiting Payment",
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Single Action Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorManager.secondaryColor,
                        ColorManager.secondaryColor.withValues(alpha: 0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
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
                      borderRadius: BorderRadius.circular(16.r),
                      onTap: () {
                        Navigator.of(context).pop(); // Close dialog
                        Navigator.of(context).pop(); // Close cart screen
                      },
                      child: Center(
                        child: Text(
                          "Great!",
                          style: TextStyles.font16WhiteBold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildDetailItem({
  required IconData icon,
  required String label,
  required String value,
  required Color color,
}) {
  return Column(
    children: [
      Icon(
        icon,
        color: color,
        size: 20,
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: TextStyles.font12GreySemiBold,

      ),
      const SizedBox(height: 2),
      Text(
        value,
        style: GoogleFonts.albertSans(
          fontSize: 14,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}