import 'package:flutter/material.dart';
import 'package:restaurant_app/core/routes/app_router.dart';

void main() {
  runApp(RestaurantApp(
    appRouter: AppRouter(),
  ));
}

class RestaurantApp extends StatelessWidget {
  final AppRouter appRouter;
  const RestaurantApp({
    super.key,
    required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      onGenerateRoute: appRouter.generateRoutes,
    );
  }
}

