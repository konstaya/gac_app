import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/updorde.dart';

class FetchDataClub {
  final box = GetStorage();
  Future<List<dynamic>> fetchClubs() async {
    try {
      final String url = 'https://vladixks.ru/api/v1/clubs';
      final response = await http.get(Uri.parse(url));
      print('1:::::::::' + response.statusCode.toString());
      return jsonDecode(utf8.decode(response.bodyBytes)) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }
  Future<List<dynamic>> fetchPromotions() async {
    try {
      final String url = 'https://vladixks.ru/api/v1/promotions/${box.read('club')}/';
      final response = await http.get(Uri.parse(url));
      print('2:::::::::' + response.statusCode.toString());
      return jsonDecode(utf8.decode(response.bodyBytes))['club_promotions'] as List;
    } catch (e) {
      print(e);
      return [];
    }
  }

  // Перенеси в фетчдатаклаб, возвращает список услуг и абонементов котоыре есть у пользователя
  // там отфильтруй по абонимаентам
  Future<List<dynamic>> fetchService() async {
    try {
      String token = 'Bearer ' + box.read('access').toString();
      final String url = 'https://vladixks.ru/api/v1/client_services_own';
      final response = await http.get(
        Uri.parse(url),
        headers: {"Authorization" : token},
      );
      print('3:::::::::' + response.statusCode.toString());
      if (response.statusCode.toString() == "401") {
        AuthMethods auth = AuthMethods();
        if (await auth.updateToken() != "200"){
          auth.deauth();
          return ['Error'];
        }
        else{
          try {
            String token = 'Bearer ' + box.read('access').toString();
            final String url = 'https://vladixks.ru/api/v1/client_services_own';
            final response = await http.get(
              Uri.parse(url),
              headers: {"Authorization" : token},
            );
            return jsonDecode(utf8.decode(response.bodyBytes)) as List;
          }catch (e){
            print(e);
            return [];
          }
        }
      }
      else{
        return jsonDecode(utf8.decode(response.bodyBytes)) as List;
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  // это пока пас, бэк подправить надо, эт крч относится к мой тренер туда передаешь
  // там крч если типа пустой или все false то диалоговое о том, что пока нет тренера
  Future<dynamic> fetchCoach() async {
    try {
      String token = 'Bearer ' + box.read('access').toString();
      final String url = 'https://vladixks.ru/api/v1/personal_request_active_c';
      final response = await http.get(
        Uri.parse(url),
        headers: {"Authorization" : token},
      );
      print('4:::::::::' + response.statusCode.toString());
      if (response.statusCode.toString() == "401") {
        AuthMethods auth = AuthMethods();
        if (await auth.updateToken() != "200"){
          auth.deauth();
          return ['Error'];
        }
        else{
          try {
            final String token = 'Bearer ${box.read('access')}';
            final url = Uri.parse('https://vladixks.ru/api/v1/personal_request_active_c');
            final response = await http.get(
                url,
                headers: {"Authorization" : token}
            );
            print(jsonDecode(utf8.decode(response.bodyBytes)) as List);
            return jsonDecode(utf8.decode(response.bodyBytes)) as List;
          }catch (e){
            print(e);
            return "Error";
          }
        }
      }
      else{
        return jsonDecode(utf8.decode(response.bodyBytes)) as List;
      }
    } catch (e) {
      print(e);
      return "Error";
    }
  }

  // Это крч вернет список всех услгу-абонементов которые есть у клуба к которому привязан клиент
  // При клике на Абонемнты И Услуги - просто передавай список этих жлементов, как в тренажере или магазине,
  // Там уже отфильтруешь
  Future<List<dynamic>> fetchServiceMember() async {
    try {
      String token = 'Bearer ' + box.read('access').toString();
      final String url = 'https://vladixks.ru/api/v1/services/${box.read('club')}/';
      final response = await http.get(
        Uri.parse(url),
        headers: {"Authorization" : token},
      );
      print('5:::::::::' + response.statusCode.toString());
      if (response.statusCode.toString() == "401") {
        AuthMethods auth = AuthMethods();
        if (await auth.updateToken() != "200"){
          auth.deauth();
          return ['Error'];
        }
        else{
          try {
            String token = 'Bearer ' + box.read('access').toString();
            final String url = 'https://vladixks.ru/api/v1/services/${box.read('club')}/';
            final response = await http.get(
              Uri.parse(url),
              headers: {"Authorization" : token},
            );
            return jsonDecode(utf8.decode(response.bodyBytes)) as List;
          }catch (e){
            print(e);
            return [];
          }
        }
      }
      else{
        return jsonDecode(utf8.decode(response.bodyBytes)) as List;
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

}