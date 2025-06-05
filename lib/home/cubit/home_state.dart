part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
}

class HomeLoaded extends HomeState{
  final List<CoachModel>? allCoach;


  HomeLoaded({this.allCoach});

}

class HomeError extends HomeState{
  final message;
  HomeError({this.message});
}