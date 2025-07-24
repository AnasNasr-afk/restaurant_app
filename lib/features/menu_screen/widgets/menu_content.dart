import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/color_manager.dart';
import '../data/menu_model.dart';
import 'menu_item_card.dart';

class MenuContent extends StatelessWidget {
  final String selectedCategory;
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;

  const MenuContent({
    super.key,
    required this.selectedCategory,
    required this.slideAnimation,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final items = MenuData.getMenuItemsByCategory(selectedCategory);

    return Container(
      color: ColorManager.backgroundColor,
      child: SlideTransition(
        position: slideAnimation,
        child: FadeTransition(
          opacity: fadeAnimation,
          child: ListView.builder(
            padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return MenuItemCard(
                category: selectedCategory, // Pass the selected category
                key: ValueKey('${item.name}_$index'),
                item: item,
                index: index,

              );
            },
          ),
        ),
      ),
    );
  }
}