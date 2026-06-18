import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/favourite/favourite_view/favourite_view.dart';
import 'package:fitness_app/features/home/home_view/home_view.dart';
import 'package:fitness_app/features/plans/plans_view/plans_view.dart';
import 'package:fitness_app/features/profile/profile_view/profile_view.dart';
import 'package:fitness_app/features/trainers/trainers_view/trainers_view.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  List<Widget> screens = [
    HomeView(),
    TrainersView(),
    PlansView(),
    FavouriteView(),
    ProfileView(),
  ];
  int currentIndex = 0;
  void onChangeScreen(int value){
    currentIndex=value;
    emit(ChangeScreenState());
  }
}
