import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dtree/models/store.dart'; 

class StoreService {
  static Future<List<Store>> fetchStores() async {
    final response = await http.get(Uri.parse('https://d3-api.onrender.com/api/v1/stores'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> storeDataList = jsonData['stores'];

      return storeDataList
          .map((storeData) => Store.fromJson(storeData))
          .toList();
    } else {
      throw Exception('Failed to load stores');
    }
  }
}
