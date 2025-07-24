import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/features/menu_screen/widgets/star_rating.dart';

import '../../../core/components/components.dart';
import '../../../core/themes/color_manager.dart';
import '../../../core/themes/text_styles.dart';
import '../data/menu_model.dart';
import 'add_to_cart_button.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;
  final int index;
  final String category; // Added category parameter

  const MenuItemCard({
    super.key,
    required this.item,
    required this.index,
    required this.category, // Required for the new add to cart button
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = item.imageUrl.trim().isNotEmpty;
    return AnimatedContainer(
      duration: Duration(milliseconds: 600 + (index * 100)),
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManager.backgroundColor, Colors.grey.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ColorManager.brownColor.withValues(alpha: 0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManager.brownColor.withValues(alpha: 0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 130,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorManager.secondaryColor.withValues(alpha: 0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: hasImage
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          item.imageUrl,
                          width: 90.w,
                          height: 90.h,
                          fit: BoxFit.cover,
                        ),
                      )
                          : buildMenuItemIcon(item.name), // fallback icon
                    ),
                    Positioned(
                      top: 10.h,
                      right: 10.w,
                      child: buildPopularBadge(item.popular),
                    ),
                  ],
                ),
              ),
              // Content section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name and Price
                      buildMenuItemHeader(item),
                      const SizedBox(height: 8),
                      buildMenuItemDescription(item),
                      const SizedBox(height: 15),
                      buildMenuItemFooter(item, category),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildMenuItemHeader(MenuItem item) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          item.name,
          style: TextStyles.font18BrownSemiBold,
        ),
      ),
      Text(
        "\$${item.price}",
        style: TextStyles.font20DarkRedBold,
      ),
    ],
  );
}

Widget buildMenuItemDescription(MenuItem item) {
  return Text(
    item.description,
    style: TextStyles.font14BrownNormal,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}

Widget buildMenuItemFooter(MenuItem item, String category) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      StarRating(rating: item.rating),
      // Updated to use the new AddToCartButton
      AddToCartButton(
        menuItem: item,
        category: category,
      ),
    ],
  );
}