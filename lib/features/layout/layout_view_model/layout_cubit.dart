import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fitness_app/core/network/dio_consumer.dart';
import 'package:fitness_app/features/favourite/favourite_view/favourite_view.dart';
import 'package:fitness_app/features/home/home_view/home_view.dart';
import 'package:fitness_app/features/home/home_view_model/search_cubit/search_cubit.dart';
import 'package:fitness_app/features/plans/plans_data/plans_repo.dart';
import 'package:fitness_app/features/plans/plans_view/plans_view.dart';
import 'package:fitness_app/features/plans/plans_view_model/plans_cubit.dart';
import 'package:fitness_app/features/profile/profile_view/profile_view.dart';
import 'package:fitness_app/features/trainers/trainers_view/trainers_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PlansCubit(PlansRepo(dioConsumer: DioConsumer(Dio())))..getPlan(),
        ),
        BlocProvider(
          create: (context) {
            final plans = context.read<PlansCubit>().state;
            if (plans is SuccessPlansState) {
              return SearchCubit(plans: plans.plans);
            }
            return SearchCubit(plans: []);
          },
        ),
      ],
      child: HomeView(),
    ),
    TrainersView(),
    PlansView(),
    FavouriteView(),
    ProfileView(),
  ];
  int currentIndex = 0;

  void onChangeScreen(int value) {
    currentIndex = value;
    emit(ChangeScreenState());
  }
}
