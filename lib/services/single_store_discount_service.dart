import 'dart:convert';
import 'package:http/http.dart' as http;

class DiscountService {
  static Future<List<dynamic>> fetchDiscountsForShop(String shopId) async {
    final response = await http.get(
        Uri.parse('https://d3-api.onrender.com/api/v1/discounts/shop/$shopId'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['discounts'];
    } else {
      throw Exception('Failed to load discounts for shop');
    }
  }
}
