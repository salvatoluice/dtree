import 'package:dtree/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReceiptPage extends StatelessWidget {
  final String discountName;
  final double amountPaid;
  final String payerName;
  final DateTime dateTime;

  const ReceiptPage({
    Key? key,
    required this.discountName,
    required this.amountPaid,
    required this.payerName,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildKeyValueRow('Discount Name:', discountName),
            _buildKeyValueRow(
              'Amount Paid:',
              'Ksh ${amountPaid.toStringAsFixed(2)}',
              highlight: true,
            ),
            _buildKeyValueRow('Payer:', payerName),
            _buildKeyValueRow(
              'Date Time:',
              DateFormat.yMMMMd().add_jm().format(dateTime),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.share,
                  label: 'Share',
                  onTap: () {
                    // Implement share functionality
                  },
                ),
                _buildActionButton(
                  icon: Icons.download,
                  label: 'Download',
                  onTap: () {
                    // Implement download functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyValueRow(String key, String value, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white,),
      label: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
