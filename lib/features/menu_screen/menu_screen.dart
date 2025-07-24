// screens/menu_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/features/menu_screen/widgets/category_tabs.dart';
import 'package:restaurant_app/features/menu_screen/widgets/menu_content.dart';
import 'package:restaurant_app/features/menu_screen/widgets/restaurant_header.dart';

import '../../core/themes/color_manager.dart';
import '../cart_screen/widgets/cart_bottom_bar.dart';
import 'cubit/menu_cubit.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  String selectedCategory = "Steaks";

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });

    // Reset animations for smooth category transition
    _slideController.reset();
    _slideController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit()..loadCartItems(), // Initialize cubit and load cart
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: Stack(
          children: [
            // Main content
            Column(
              children: [
                // Restaurant Header with Awning
                const RestaurantHeader(),

                // Category Selection Tabs
                CategoryTabs(
                  selectedCategory: selectedCategory,
                  onCategorySelected: _onCategorySelected,
                ),

                // Menu Items List
                Expanded(
                  child: MenuContent(
                    selectedCategory: selectedCategory,
                    slideAnimation: _slideAnimation,
                    fadeAnimation: _fadeAnimation,
                  ),
                ),
              ],
            ),

            // Cart Bottom Bar - positioned at bottom
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: CartBottomBar(),
            ),
          ],
        ),
      ),
    );
  }
}