import '/home/cubit/fetch_data_home.dart';
import '/home/cubit/models/coach_model.dart';


class HomeRepository{
  final FetchDataHome fetchDataHome;

  HomeRepository({required this.fetchDataHome});

  Future<List<CoachModel>?> fetchAllCoach() async{
    final coach_item = await fetchDataHome.fetchAllCoach();
    return coach_item.map((e) => CoachModel.fromJson(e)).toList();
  }

  Future<List> fetchAll() async{
    return [await fetchAllCoach()];
  }
}