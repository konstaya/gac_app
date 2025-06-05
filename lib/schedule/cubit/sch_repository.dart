

import '/schedule/cubit/models/gr_rec_model.dart';
import '/schedule/cubit/models/group_model.dart';
import '/schedule/cubit/models/person_model.dart';
import '/schedule/cubit/sch_fetch.dart';

class SchRepository{
  final SchFetchData trainingsData;

  SchRepository({required this.trainingsData});

  Future<List<GroupModel>?>  fetchGroup() async{
    final clients_item = await trainingsData.fetchGroupTrainings();
    return clients_item.map((e) => GroupModel.fromJson(e)).toList();
  }

  Future<List<PersonModel>?>  fetchPerson() async{
    final clients_item = await trainingsData.fetchPersonTrainings();
    return clients_item.map((e) => PersonModel.fromJson(e)).toList();
  }

  Future<List<GrRecModel>?>  fetchRecords() async{
    final clients_item = await trainingsData.fetchGrRec();
    return clients_item.map((e) => GrRecModel.fromJson(e)).toList();
  }

  // Future<List> fetchAll() async{
  //   return [await fetchGroup(), await fetchPerson(), await fetchRecords()];
  // }

  Future<List> fetchAll() async {
    final futures = [
      fetchGroup(),
      fetchPerson(),
      fetchRecords(),
    ];

    return await Future.wait(futures);
  }
}