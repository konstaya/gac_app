import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '/constants/updorde.dart';

class SchFetchData{
  final box = GetStorage();
  Future<List<dynamic>> fetchGroupTrainings() async {
    try {
      final String token = 'Bearer ${box.read('access')}';
      final url = Uri.parse('https://vladixks.ru/api/v1/group_trainings_list');
      final response = await http.get(
          url,
          headers: {"Authorization" : token}
      );
      print('-----groupTrainings:' +  response.statusCode.toString());
      if (response.statusCode.toString() == "401") {
        AuthMethods auth = AuthMethods();
        if (await auth.updateToken() != "200"){
          auth.deauth();
          return ['Error'];
        }
        else{
          try {
            final String token = 'Bearer ${box.read('access')}';
            final url = Uri.parse('https://vladixks.ru/api/v1/group_trainings_list');
            final response = await http.get(
                url,
                headers: {"Authorization" : token}
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

  Future<List<dynamic>> fetchGrRec() async {
    try {
      final String token = 'Bearer ${box.read('access')}';
      final url = Uri.parse('https://vladixks.ru/api/v1/group_records');
      final response = await http.get(
          url,
          headers: {"Authorization" : token}
      );
      print('-----records:' +  response.statusCode.toString());
      if (response.statusCode.toString() == "401") {
        AuthMethods auth = AuthMethods();
        if (await auth.updateToken() != "200"){
          auth.deauth();
          return ['Error'];
        }
        else{
          try {
            final String token = 'Bearer ${box.read('access')}';
            final url = Uri.parse('https://vladixks.ru/api/v1/group_records');
            final response = await http.get(
                url,
                headers: {"Authorization" : token}
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

  Future<List<dynamic>> fetchPersonTrainings() async {
    try {
      final String token = 'Bearer ${box.read('access')}';
      final url = Uri.parse('https:/vladixks.ru/api/v1/personal_trainings_own');
      final response = await http.get(
          url,
          headers: {"Authorization" : token}
      );
      print('-----Pers train:' +  response.statusCode.toString());
      if (response.statusCode.toString() == "401") {
        AuthMethods auth = AuthMethods();
        if (await auth.updateToken() != "200"){
          auth.deauth();
          return ['Error'];
        }
        else{
          try {
            final String token = 'Bearer ${box.read('access')}';
            final url = Uri.parse('https://vladixks.ru/api/v1/personal_trainings_own');
            final response = await http.get(
                url,
                headers: {"Authorization" : token}
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