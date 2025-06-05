import 'models/trainer_model.dart';
import 'fetch_data.dart';

class TrainerRepository{
  final FetchDataTrainer fetchData;

  TrainerRepository({required this.fetchData});

  Future<List<TrainerModel>?> fetchItem() async{
    final trainer_item = await fetchData.fetchTrainers();
    print(trainer_item);
    return trainer_item.map((e) => TrainerModel.fromJson(e)).toList();
  }

  Future<List> fetchAll() async{
    return [await fetchItem()];
  }
}