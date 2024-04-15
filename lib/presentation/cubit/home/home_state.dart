part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class AddExpenseState extends HomeState {}
final class EditExpenseState extends HomeState {
  final dynamic item;
  EditExpenseState(this.item);
}
final class DetailExpenseState extends HomeState {
  final dynamic item;
  DetailExpenseState(this.item);
}

final class HomeData extends HomeState {}
final class HomeLoaded extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
