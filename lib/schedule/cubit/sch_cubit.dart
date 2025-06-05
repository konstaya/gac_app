import 'package:bloc/bloc.dart';
import '/schedule/cubit/models/gr_rec_model.dart';
import '/schedule/cubit/models/person_model.dart';
import '/schedule/cubit/sch_repository.dart';
import 'package:meta/meta.dart';

import 'models/group_model.dart';

part 'sch_state.dart';

class SchCubit extends Cubit<SchState> {
  SchCubit(this.schRepository) : super(SchLoading());

  final SchRepository schRepository;

  Future<List<PersonModel>?> fetchSchData() async {
    try {
      emit(SchLoading());
      schRepository.fetchAll().then((value) {
        if (value[0] == ['Error'] || value[1] == ['Error'] || value[2] == ['Error']){
          emit(SchError(message: "Error"));
        }
        else{
          emit(SchLoaded(
            groupList: value[0],
            personList: value[1],
            grRecList: value[2],
          ));
        }
      });
    } catch (e) {
      print("Try Catch000");
      print(e);
      emit(SchError(message: e.toString()));
    }
  }
}
