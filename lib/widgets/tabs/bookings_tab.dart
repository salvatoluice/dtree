import 'dart:convert';
import 'package:dtree/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:dtree/models/booking.dart';

class BookingsTab extends StatefulWidget {
  BookingsTab({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BookingsTabState createState() => _BookingsTabState();
}

class _BookingsTabState extends State<BookingsTab> {
  final List<Booking> bookings = [];

  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    fetchBookings();
  }

  Future<void> fetchBookings() async {
    final String? userDataString = await storage.read(key: 'userData');

    if (userDataString != null) {
      final userData = jsonDecode(userDataString);
      final String? token = userData['token'];

      if (token != null) {
        const url = 'https://d3-api.onrender.com/api/v1/bookings/user/get';

        final response = await http.get(
          Uri.parse(url),
          headers: <String, String>{
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          final List<dynamic> responseData =
              jsonDecode(response.body)['bookings'];

          setState(() {
            bookings.clear();
            for (var bookingData in responseData) {
              bookings.add(Booking.fromJson(bookingData));
            }
          });
        } else {
          throw Exception('Failed to load bookings');
        }
      } else {
        throw Exception('Token not found in userData');
      }
    } else {
      throw Exception('User data not found in secure storage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return ListTile(
          title: Text(
            booking.discountName.length > 13
                ? '${booking.discountName.substring(0, 13)}...'
                : booking.discountName,
          ),
          subtitle: Text(booking.storeName),
          trailing: Text(booking.time),
          onTap: () {
            _showBookingDetails(context, booking);
          },
        );
      },
    );
  }

  void _showBookingDetails(BuildContext context, Booking booking) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Booking Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(booking.discountName),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Store',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(booking.storeName),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Time',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(booking.time),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Initial Price',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text('Kes ${booking.initialPrice.toStringAsFixed(2)}'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Discount',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(booking.discount.toString().replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},',
                      )),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Price After Discount',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                      'Kes ${booking.priceAfterDiscount.toStringAsFixed(2).replaceAllMapped(
                            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]},',
                          )}'),
                ],
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Reschedule Booking',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
