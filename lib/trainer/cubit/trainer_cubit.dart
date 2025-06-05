import 'package:bloc/bloc.dart';
import '/trainer/cubit/models/trainer_model.dart';
import '/trainer/cubit/trainer_repository.dart';
import 'package:meta/meta.dart';

part 'trainer_state.dart';

class TrainerCubit extends Cubit<TrainerState> {
  TrainerCubit(this.trainerRepository) : super(TrainerLoading());
  final TrainerRepository trainerRepository;

  Future<List<TrainerModel>?> fetchData() async {
    try {
      emit(TrainerLoading());
      trainerRepository.fetchAll().then((value) {
        emit(TrainerLoaded(
            trainerItems: value[0]));
      });
    } catch (e) {
      print("Try Catch000");
      print(e);
      emit(TrainerError(message: e.toString()));
    }
  }
}
