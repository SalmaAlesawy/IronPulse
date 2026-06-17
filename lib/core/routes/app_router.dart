import 'package:fitness_app/core/routes/page_route_names.dart';
import 'package:fitness_app/features/onboarding/onboarding_view/onboarding_screen.dart';
import 'package:fitness_app/features/splash_view/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
          settings: settings,
        );
      case PageRouteNames.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("No Route Found"))),
          settings: settings,
        );
    }
  }
}
