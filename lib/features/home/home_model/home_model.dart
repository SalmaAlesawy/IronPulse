import 'package:flutter/material.dart';

class HomeModel {
  
  String image;
  String level;
  String title;
  String description;
  String time;
  String type;
  IconData icon;

  HomeModel({
    required this.image,
    required this.level,
    required this.title,
    required this.description,
    required this.time,
    required this.type,
    required this.icon
  });
}
