part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {
}

class ProfileLoading extends ProfileState {
}

class ProfileLoaded extends ProfileState{
final List<ClubModel>? club;
final List<Promotion>? proms;
final List<ServiceModel>? services;
final List<ClientServiceModel>? myServices;
final List? coachInfo;


ProfileLoaded({this.club, this.proms, this.services, this.myServices, this.coachInfo});

}

class ProfileError extends ProfileState{
  final message;
  ProfileError({this.message});
}