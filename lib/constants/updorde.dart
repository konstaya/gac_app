import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class AuthMethods{
  Future<String> updateToken() async{
    final box = GetStorage();
    var url = Uri.parse('https://vladixks.ru/api/v1/token_refresh');
    var response = await http.post(
      url,
      body: {'refresh': box.read('refresh')},
    );
    print('update status:${response.statusCode}');
    box.write('access', json.decode(response.body)['access']);
    box.write('refresh', json.decode(response.body)['refresh']);
    box.write('role', json.decode(response.body)['role']);
    return response.statusCode.toString();
  }

  void deauth(){
    final box = GetStorage();
    box.remove('access');
    box.remove('refresh');
    box.remove('role');
    box.remove('club');
    box.remove('name');
    box.remove('id');
  }
}