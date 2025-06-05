part of 'trainer_cubit.dart';

@immutable
abstract class TrainerState {}

class TrainerLoading extends TrainerState {
}

class TrainerLoaded extends TrainerState{
  final List<TrainerModel>? trainerItems;

  TrainerLoaded({this.trainerItems});

}

class TrainerError extends TrainerState{
  final message;
  TrainerError({this.message});
}
