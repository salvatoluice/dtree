import 'package:dtree/main.dart';
import 'package:flutter/material.dart';
import 'package:dtree/models/booking.dart';

class BookingsTab extends StatelessWidget {
  BookingsTab({Key? key}) : super(key: key);

 final List<Booking> bookings = [
    Booking(
      discountName: '20% Off on Spa Services',
      storeName: 'Relaxation Spa',
      time: '10:00 AM, May 15',
      initialPrice: 80.0,
      discount: 20,
      priceAfterDiscount: 64.0,
    ),
    Booking(
      discountName: 'Free Haircut with Color Treatment',
      storeName: 'Glamour Hair Salon',
      time: '11:30 AM, May 16',
      initialPrice: 150.0,
      discount: 100, // Free haircut, so discount is 100%
      priceAfterDiscount: 0.0, // Price becomes 0 after discount
    ),
    Booking(
      discountName: '50% Off on Full Makeup Session',
      storeName: 'Beauty Makeup Studio',
      time: '9:00 AM, May 17',
      initialPrice: 80.0,
      discount: 50,
      priceAfterDiscount: 40.0,
    ),
    Booking(
      discountName: '10% Off on Car Repair Services',
      storeName: 'AutoFix Garage',
      time: '2:00 PM, May 18',
      initialPrice: 200.0,
      discount: 10,
      priceAfterDiscount: 180.0,
    ),
    Booking(
      discountName: 'Special Discount on House Cleaning',
      storeName: 'CleanPro Services',
      time: '12:00 PM, May 19',
      initialPrice: 120.0,
      discount: 25,
      priceAfterDiscount: 90.0,
    ),
    Booking(
      discountName: '20% Off on Pet Grooming',
      storeName: 'Paws & Claws Pet Spa',
      time: '3:30 PM, May 20',
      initialPrice: 60.0,
      discount: 20,
      priceAfterDiscount: 48.0,
    ),
    Booking(
      discountName: '15% Off on Photography Session',
      storeName: 'Capture Moments Photography',
      time: '10:00 AM, May 21',
      initialPrice: 180.0,
      discount: 15,
      priceAfterDiscount: 153.0,
    ),
    Booking(
      discountName: 'Special Discount on Lawn Care Services',
      storeName: 'GreenThumb Landscapes',
      time: '8:00 AM, May 22',
      initialPrice: 90.0,
      discount: 40,
      priceAfterDiscount: 54.0,
    ),
    Booking(
      discountName: 'Free Fitness Class for New Members',
      storeName: 'FitZone Gym',
      time: '6:00 PM, May 23',
      initialPrice: 0.0, // Free class, so initial price is 0
      discount: 100, // Free class, so discount is 100%
      priceAfterDiscount: 0.0, // Price becomes 0 after discount
    ),
    Booking(
      discountName: '20% Off on Tutoring Services',
      storeName: 'SmartKids Learning Center',
      time: '4:00 PM, May 24',
      initialPrice: 200.0,
      discount: 20,
      priceAfterDiscount: 160.0,
    ),
  ];

  String _truncateWithEllipsis(String text, int maxLength) {
    return (text.length <= maxLength)
        ? text
        : '${text.substring(0, maxLength)}...';
  }


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
                  Text(
                    _truncateWithEllipsis(booking.discountName,
                        20),
                  ),
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
