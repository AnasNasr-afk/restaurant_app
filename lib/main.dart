import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/core/routes/app_router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant App',
        onGenerateRoute: appRouter.generateRoutes,
      ),
    );
  }
}

