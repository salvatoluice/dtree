import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dtree/models/discount.dart';

class DiscountService {
  static Future<List<Discount>> fetchDiscounts() async {
    final response = await http.get(Uri.parse('https://d3-api.onrender.com/api/v1/discounts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['discounts'];

      List<Discount> discounts =
          data.map((json) => Discount.fromJson(json)).toList();

      return discounts;
    } else {
      throw Exception('Failed to load discounts');
    }
  }
}
