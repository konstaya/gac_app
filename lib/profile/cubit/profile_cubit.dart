import 'package:bloc/bloc.dart';
import '/profile/cubit/models/coach_model.dart';
import '/profile/cubit/models/club_model.dart';
import '/profile/cubit/models/promotion_model.dart';
import 'package:meta/meta.dart';

import 'club_repository.dart';
import 'models/client_service_model.dart';
import 'models/service_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {

  ProfileCubit(this.clubRepository) : super(ProfileLoading());

  final ClubRepository clubRepository;

  Future<List<ClubModel>?> fetchDataClub() async {
    try {
      emit(ProfileLoading());

      clubRepository.fetchAll().then((value) {
        if (value[2] == ['Error'] || value[3] == ['Error']){
           emit(ProfileError(message: 'Error'));
        }
        else {
          emit(ProfileLoaded(
              club: value[0],
              proms: value[1],
              services: value[2],
              myServices: value[3],
            coachInfo: value[4]
          ),
          );
        }

      });
    } catch (e) {
      print("Try Catch000");
      print(e);
      emit(ProfileError(message: e.toString()));
    }
  }

}
