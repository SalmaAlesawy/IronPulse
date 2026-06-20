import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/plans/plans_model/plans_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.plans}) : super(SearchInitial());
  final List<PlansModel> plans;
  late List<PlansModel> filteredPlans = [];
  TextEditingController searchController = TextEditingController();
  void searchMethod(String keyWord) {
    filteredPlans = plans.where((plan) {
      final name = plan.name.toString().toLowerCase();
      final input = keyWord.toLowerCase();
      return name.contains(input);
    }).toList();
    if (filteredPlans.isNotEmpty) {
      emit(FoundPlanState());
    } else {
      emit(NotFoundPlanState());
    }
  }
}
