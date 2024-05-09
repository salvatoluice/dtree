import 'dart:convert';
import 'package:http/http.dart' as http;

class SingleDiscountService {
  static Future<Map<String, dynamic>> fetchDiscount(String discountId) async {
    final response = await http.get(
        Uri.parse('https://d3-api.onrender.com/api/v1/discounts/$discountId'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['discount'];
    } else {
      throw Exception('Failed to load discount');
    }
  }
}
