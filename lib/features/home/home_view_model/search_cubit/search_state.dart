part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class FoundPlanState extends SearchState{}
final class NotFoundPlanState extends SearchState{}
