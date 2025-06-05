import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constants/updorde.dart';

class FetchDataHome {
  final box = GetStorage();

  Future<List<dynamic>> fetchAllCoach() async {
    try {
      String token = 'Bearer ' + box.read('access').toString();
      final String url = 'https://vladixks.ru/api/v1/coaches';
      final response = await http.get(
        Uri.parse(url),
        headers: {"Authorization" : token},
      );
      print('6:::::::::' + response.statusCode.toString());
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      if (response.statusCode.toString() == "401") {
        AuthMethods auth = AuthMethods();
        if (await auth.updateToken() != "200"){
          auth.deauth();
          return ['Error'];
        }
        else{
          try {
            String token = 'Bearer ' + box.read('access').toString();
            final String url = 'https://vladixks.ru/api/v1/coaches';
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