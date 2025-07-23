import 'package:flutter/material.dart';
import 'package:restaurant_app/core/routes/routes.dart';
import 'package:restaurant_app/features/login_screen/login_screen.dart';

import '../../features/onboarding_screen/onboarding_screen.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return null; // Return null if no route matches
    }
    return null;
  }
}
