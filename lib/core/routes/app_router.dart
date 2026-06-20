import 'package:dio/dio.dart';
import 'package:fitness_app/core/network/dio_consumer.dart';
import 'package:fitness_app/core/routes/page_route_names.dart';
import 'package:fitness_app/features/authentication/login/login_view/login_view.dart';
import 'package:fitness_app/features/layout/layout_view.dart';
import 'package:fitness_app/features/layout/layout_view_model/layout_cubit.dart';
import 'package:fitness_app/features/onboarding/onboarding_view/onboarding_screen.dart';
import 'package:fitness_app/features/splash/splash_view.dart';
import 'package:fitness_app/features/trainers/trainers_data/trainers_repo.dart';
import 'package:fitness_app/features/trainers/trainers_view/trainers_view.dart';
import 'package:fitness_app/features/trainers/trainers_view_model/trainers_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
      case PageRouteNames.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
          settings: settings,
        );
      case PageRouteNames.trainersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => TrainersCubit(
              trainersRepo: TrainersRepo(dioConsumer: DioConsumer(Dio())),
            )..loadTrainers(),
            child: TrainersView(),
          ),
          settings: settings,
        );
      case PageRouteNames.signIn:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
          settings: settings,
        );
      case PageRouteNames.layout:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => LayoutCubit()),
              BlocProvider(
                create: (context) => TrainersCubit(
                  trainersRepo: TrainersRepo(dioConsumer: DioConsumer(Dio())),
                )..loadTrainers(),
              ),
            ],
            child: LayoutView(),
          ),
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
