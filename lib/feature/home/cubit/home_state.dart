part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeDummyLoading extends HomeState {}

class HomeError extends HomeState {
  HomeError({required this.message});
  final String message;
}

class HomeSuccess extends HomeState {
  const HomeSuccess({required this.games});
  final Stream<List<Games>> games;

  @override
  List<Object> get props => [games];
}
