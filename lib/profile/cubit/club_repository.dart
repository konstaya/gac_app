//import 'dart:html';

import '/profile/cubit/models/coach_model.dart';
import '/profile/cubit/fetch_data_club.dart';
import '/profile/cubit/models/client_service_model.dart';
import '/profile/cubit/models/service_model.dart';
import '/profile/cubit/models/club_model.dart';
import '/profile/cubit/models/promotion_model.dart';

class ClubRepository{
  final FetchDataClub fetchDataClub;

  ClubRepository({required this.fetchDataClub});

  Future<List<ClubModel>?> fetchClubs() async{
    final club_item = await fetchDataClub.fetchClubs();
    return club_item.map((e) => ClubModel.fromJson(e)).toList();
  }
  Future<List<Promotion>?> fetchPromotions() async{
    final proms = await fetchDataClub.fetchPromotions();
    return proms.map((e) => Promotion.fromJson(e['promotion'])).toList();
  }

  // НОВЫЕ функ снизу, там добавь их в кубит, стейт


  Future<List<ClientServiceModel>?> fetchActiveService() async{
    final act_service = await fetchDataClub.fetchService();
    return act_service.map((e) => ClientServiceModel.fromJson(e)).toList();
  }

  Future<List> fetchCoach() async{
    final coach_info = await fetchDataClub.fetchCoach();
    return coach_info.map((e) => CoachModel.fromJson(e)).toList();
  }
  Future<List<ServiceModel>?> fetchAllServiceOfClub() async{
    final all_services = await fetchDataClub.fetchServiceMember();
    return all_services.map((e) => ServiceModel.fromJson(e)).toList();
  }


  Future<List> fetchAll() async {
    final futures = [
      fetchClubs(),
      fetchPromotions(),
      fetchAllServiceOfClub(),
      fetchActiveService(),
      fetchCoach(),
    ];

    return await Future.wait(futures);
  }
}