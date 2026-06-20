import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PlansModel {
  final String? description;
  final int? durationWeeks;
  final int? id;
  final String? image;
  final String? level;
  final String? name;
  final List<Steps>? steps;
  bool isFavourite;

   PlansModel({
    required this.description,
    required this.durationWeeks,
    required this.id,
    required this.image,
    required this.level,
    required this.name,
    required this.steps,
    this.isFavourite=false
  });

  factory PlansModel.fromJson(Map<String, dynamic> json) {
    return PlansModel(
      description: json['description'],
      durationWeeks: json['durationWeeks'],
      id: json['id'],
      image: json['image'],
      level: json['level'],
      name: json['name'],
      steps: List<Steps>.from(json['steps'].map((x) => Steps.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'durationWeeks': durationWeeks,
      'id': id,
      'image': image,
      "level": level,
      'name': name,
      'steps': steps,
    };
  }
}

@JsonSerializable()
class Steps {
  final int? day;
  final int? duration;
  final String? reps;
  final int? week;
  final String? workoutName;


  const Steps({
    required this.day,
    required this.duration,
    required this.reps,
    required this.week,
    required this.workoutName,
  });

  factory Steps.fromJson(Map<String, dynamic> json) {
    return Steps(
      day: json['day'],
      duration: json['duration'],
      reps: json['reps'],
      week: json['week'],
      workoutName: json['workoutName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'duration': duration,
      'reps': reps,
      'week': week,
      'workoutName': workoutName,
    };
  }
}
