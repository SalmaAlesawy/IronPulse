part of 'plans_cubit.dart';

@immutable
sealed class PlansState {}

final class PlansInitial extends PlansState {}
final class LoadingPlansState extends PlansState{}
final class SuccessPlansState extends PlansState{
  List<PlansModel> plans;

  SuccessPlansState({required this.plans});
}
final class ErrorPlansState extends PlansState{
  String errorMessage;
  ErrorPlansState({required this.errorMessage});
}
