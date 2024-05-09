import 'dart:convert';
import 'package:http/http.dart' as http;

class SingleStoreService {
  static Future<Map<String, dynamic>> fetchStore(String storeId) async {
    final response = await http
        .get(Uri.parse('https://d3-api.onrender.com/api/v1/stores/$storeId'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['store'];
    } else {
      throw Exception('Failed to load store');
    }
  }
}
