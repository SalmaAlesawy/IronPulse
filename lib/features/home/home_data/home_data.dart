import 'package:fitness_app/features/home/home_model/home_model.dart';
import 'package:flutter/material.dart';

class HomeData {
 static List<HomeModel> homeData = [
    HomeModel(
      level: "Intermediate",
      title: "Full Body Power",
      description:
          "High-intensity functional\n movements designed to build raw…",
      time: "45",
      type: "Weight",
      icon: Icons.fitness_center_outlined,
      image: 'assets/images/intermedaite_image.png',
    ),
    HomeModel(
      level: "Advanced",
      title: "Muscle Growth Max",
      description:
          "Targeted hypertrophy training\nfocusing on progressive overload…",
      time: "60",
      type: "550 kcal",
      icon: Icons.local_fire_department_outlined,
      image: 'assets/images/advanced_image.png',
    ),
    HomeModel(
      level: "Beginner",
      title: "Core Fundamentals",
      description:
          "Perfect for beginners. Learn the\nessential movements to build a…",
      time: "30",
      type: "No Gear",
      icon: Icons.man_2,
      image: 'assets/images/beginer_image.png',
    ),
  ];
}
