import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/themes/color_manager.dart';
import '../data/menu_model.dart';

class CategoryTabs extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryTabs({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 70,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: MenuData.categories.length,
        itemBuilder: (context, index) {
          final category = MenuData.categories[index];
          final isSelected = selectedCategory == category;

          return _buildCategoryTab(category, isSelected);
        },
      ),
    );
  }

  Widget _buildCategoryTab(String category, bool isSelected) {
    return GestureDetector(
      onTap: () => onCategorySelected(category),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.secondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected
                ? ColorManager.secondaryColor
                : ColorManager.brownColor.withAlpha(75),
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: ColorManager.secondaryColor.withAlpha(80),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ]
              : null,
        ),
        child: Center(
          child: Text(
            category,
            style: GoogleFonts.albertSans(
              color: isSelected ? Colors.white : ColorManager.brownColor,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
