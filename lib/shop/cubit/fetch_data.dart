import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchData {
  Future<List<dynamic>> fetchProducts() async {
    try {
      final String url = 'https://vladixks.ru/api/v1/shop_products';
      final response = await http.get(Uri.parse(url));
      return jsonDecode(utf8.decode(response.bodyBytes)) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }
  Future<List<dynamic>> fetchShop() async {
    try {
      final String url = 'https://vladixks.ru/api/v1/shop';
      final response = await http.get(Uri.parse(url));
      return jsonDecode(utf8.decode(response.bodyBytes)) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }
  Future<List<dynamic>> fetchPromotion() async {
    try {
      final String url = 'https://vladixks.ru/api/v1/shop_promotions';
      final response = await http.get(Uri.parse(url));
      return jsonDecode(utf8.decode(response.bodyBytes)) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }
  Future<List<dynamic>> fetchDelivery() async {
    try {
      final String url = 'https://vladixks.ru/api/v1/shop_delivery';
      final response = await http.get(Uri.parse(url));
      return jsonDecode(utf8.decode(response.bodyBytes)) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }
}