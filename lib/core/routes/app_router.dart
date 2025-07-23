import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/core/routes/routes.dart';
import 'package:restaurant_app/features/login_screen/login_screen.dart';

import '../../features/login_screen/cubit/login_cubit.dart';
import '../../features/menu_screen/menu_screen.dart';
import '../../features/onboarding_screen/onboarding_screen.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen()));
        case Routes.menuScreen:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      default:
        return null; // Return null if no route matches
    }
  }
}
