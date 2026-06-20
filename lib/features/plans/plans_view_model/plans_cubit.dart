import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/plans/plans_data/plans_repo.dart';
import 'package:fitness_app/features/plans/plans_model/plans_model.dart';
import 'package:meta/meta.dart';

part 'plans_state.dart';

class PlansCubit extends Cubit<PlansState> {
  PlansCubit(this.plansRepo) : super(PlansInitial());
  PlansRepo plansRepo;
  Future<void> getPlan() async {
    print("Start");
    emit(LoadingPlansState());
    try {
      final response = await plansRepo.getPlans();
      response?.fold(
        (error) {
          emit(ErrorPlansState(errorMessage: error));
          print("error");
        },
        (plans) {
          emit(SuccessPlansState(plans: plans));
          print("plans.length");
        },
      );
      print("response received");
      print(response);
    } catch (e) {
      emit(ErrorPlansState(errorMessage: e.toString()));
    }
  }

  void toggleFavourite(int index){
    final currentState=state;
    if(currentState is SuccessPlansState){
      final updatedList=List<PlansModel>.from(currentState.plans);
      updatedList[index].isFavourite=!updatedList[index].isFavourite;
      emit(SuccessPlansState(plans: updatedList));
    }
  }
}
