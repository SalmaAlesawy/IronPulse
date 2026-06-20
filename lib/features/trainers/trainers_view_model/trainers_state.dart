import 'package:fitness_app/features/trainers/trainers_model/trainers_model.dart';

abstract class TrainersState {}

class TrainersInitialState extends TrainersState {}

class TrainersLoadingState extends TrainersState {}

class TrainersLoadedState extends TrainersState {
  final List<TrainersModel> trainers;
  TrainersLoadedState({required this.trainers});
}

class TrainersErrorState extends TrainersState {
  final String errorMessage;
  TrainersErrorState({required this.errorMessage});
}
