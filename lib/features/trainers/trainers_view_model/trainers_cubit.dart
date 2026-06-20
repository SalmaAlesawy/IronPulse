import 'package:fitness_app/features/trainers/trainers_data/trainers_repo.dart';
import 'package:fitness_app/features/trainers/trainers_view_model/trainers_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainersCubit extends Cubit<TrainersState> {
  TrainersCubit({required this.trainersRepo}) : super(TrainersInitialState());
  final TrainersRepo trainersRepo;

  Future<void> loadTrainers() async {
    emit(TrainersLoadingState());
    final result = await trainersRepo.getTrainers();
    result.fold(
      (error) => emit(TrainersErrorState(errorMessage: error)),
      (trainers) => emit(TrainersLoadedState(trainers: trainers)),
    );
  }
}
