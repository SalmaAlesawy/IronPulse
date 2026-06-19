import 'package:fitness_app/core/database/cache/cache_helper.dart';
import 'package:fitness_app/core/routes/app_router.dart';
import 'package:fitness_app/core/routes/page_route_names.dart';
import 'package:fitness_app/core/themes/theme_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IronPulse',
      theme: ThemeManager.getTheme(),
      initialRoute: PageRouteNames.splashScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
