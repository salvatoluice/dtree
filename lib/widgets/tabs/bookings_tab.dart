import 'package:dtree/main.dart';
import 'package:flutter/material.dart';
import 'package:dtree/models/booking.dart';

class BookingsTab extends StatelessWidget {
  BookingsTab({Key? key}) : super(key: key);

  final List<Booking> bookings = [
    Booking(
      discountName: '50% Off on Shoes',
      storeName: 'Shoe Emporium',
      time: '10:00 AM, May 15',
      initialPrice: 100.0,
      discount: 50,
      priceAfterDiscount: 50.0,
    ),
    Booking(
      discountName: '30% Off on Electronics',
      storeName: 'Tech Mart',
      time: '11:30 AM, May 16',
      initialPrice: 200.0,
      discount: 30,
      priceAfterDiscount: 140.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return ListTile(
          title: Text(booking.discountName),
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
                    'Discount',
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
                  Text('\Kes ${booking.initialPrice.toStringAsFixed(2)}'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '% discount',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text('${booking.discount}%'),
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
                  Text('\Kes ${booking.priceAfterDiscount.toStringAsFixed(2)}'),
                ],
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Handle reschedule booking
                },
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
