import 'package:fitness_app/features/home/home_model/home_model.dart';
import 'package:flutter/material.dart';

class HomeData {
 static List<HomeModel> homeData = [
    HomeModel(
      title: "Full Body Power",
      time: "45",
      type: "Weight",
      icon: Icons.fitness_center_outlined,
    ),
    HomeModel(
      title: "Muscle Growth Max",
      time: "60",
      type: "550 kcal",
      icon: Icons.local_fire_department_outlined,
    ),
    HomeModel(
      title: "Core Fundamentals",
      time: "30",
      type: "No Gear",
      icon: Icons.man_2,
    ),
  ];
}
