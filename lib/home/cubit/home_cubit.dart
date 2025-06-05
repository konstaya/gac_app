import 'package:bloc/bloc.dart';
import '/home/cubit/home_repository.dart';
import '/home/cubit/models/coach_model.dart';
import '/profile/cubit/profile_cubit.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit(this.homeRepository) : super(HomeInitial());

  final HomeRepository homeRepository;
  Future<List<CoachModel>?> fetchDataHome() async {
    try{
      emit(HomeLoading());
      homeRepository.fetchAll().then((value) {
        if (value[0] == ['Error']){
          emit(HomeError(message: 'Error'));
        }
        else{
          emit(HomeLoaded(
            allCoach: value[0] ));
        }
      });
    }
    catch (e) {
      print("Try Catch000");
      print(e);
      emit(HomeError(message: e.toString()));
    }
  }


}
