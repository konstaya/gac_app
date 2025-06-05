part of 'sch_cubit.dart';

@immutable
abstract class SchState {

}

class SchLoading extends SchState {
}

class SchLoaded extends SchState{
  final List<PersonModel>? personList;
  final List<GroupModel>? groupList;
  final List<GrRecModel>? grRecList;
  SchLoaded({this.personList, this.groupList, this.grRecList});
}

class SchError extends SchState{
  final message;
  SchError({this.message});
}
