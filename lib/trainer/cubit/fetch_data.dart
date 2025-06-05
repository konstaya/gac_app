import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class FetchDataTrainer {
  Future<List<dynamic>> fetchTrainers() async {
    final box = GetStorage();
    String club_id = box.read('club');
    try {
      final String url = 'https://vladixks.ru/api/v1/trainers/' + club_id;
      print(url);
      final response = await http.get(Uri.parse(url));
      return (jsonDecode(utf8.decode(response.bodyBytes)))['club_trainers'] as List;
    } catch (e) {
      print(e);
      return [];
    }
  }
}