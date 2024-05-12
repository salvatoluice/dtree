import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Discoun3!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Who We Are',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Discoun3 is a leading online discount store that connects savvy shoppers with their preferred service outlets, be it restaurants, salons, fitness centers, entertainment venues, or any other service industry.',
            ),
            const SizedBox(height: 16),
            const Text(
              'What We Offer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOfferItem(
                  'Unbeatable Discounts',
                  'Exclusive deals that you won\'t find anywhere else, ensuring significant savings without compromising quality.',
                ),
                _buildOfferItem(
                  'Convenient Booking',
                  'Easily book appointments or services directly through our platform, streamlining the process for you.',
                ),
                _buildOfferItem(
                  'Personalized Recommendations',
                  'Intelligent system suggests deals based on your preferences, ensuring you never miss out on offers that align with your interests.',
                ),
                _buildOfferItem(
                  'Secure Transactions',
                  'Shop with confidence knowing that your payments are secure and your personal information is protected.',
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'How We Help Shoppers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHelpItem(
                  'Increased Visibility',
                  'Provide service providers with a platform to showcase their offerings to a vast audience of potential customers.',
                ),
                _buildHelpItem(
                  'Boosted Bookings',
                  'Helps service providers fill their schedules by connecting them with customers actively seeking their services.',
                ),
                _buildHelpItem(
                  'Marketing Support',
                  'Dedicated marketing initiatives amplify your brand\'s reach, ensuring that your services gain the attention they deserve.',
                ),
                _buildHelpItem(
                  'Feedback Loops',
                  'Receive valuable feedback from customers, enabling you to enhance your services based on real-time insights and customer preferences.',
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Our Team',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'At Discoun3, we believe in the power of great experiences and smart savings. Join our vibrant community and embrace a world of discounts, seamless bookings, and thriving businesses.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Thank you for choosing Discoun3 – where incredible discounts meet exceptional services!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(description),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildHelpItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(description),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutUsScreen(),
  ));
}
