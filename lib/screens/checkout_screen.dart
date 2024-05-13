import 'package:dtree/widgets/receipt.dart';
import 'package:dtree/widgets/results/failed.dart';
import 'package:dtree/widgets/results/success.dart';
import 'package:flutter/material.dart';
import 'package:dtree/main.dart'; 

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentMethod? _selectedPaymentMethod;
  String? _phoneNumber;
  String? _cardNumber;
  String? _expiryDate;
  String? _cvv;

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: primaryColor, 
        content: Text(
          message,
          style: TextStyle(color: Colors.white), 
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Payment Method:',
              style: Theme.of(context).textTheme.headline6,
            ),
            RadioListTile<PaymentMethod>(
              title: const Text('M-Pesa'),
              value: PaymentMethod.mpesa,
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            RadioListTile<PaymentMethod>(
              title: const Text('Visa/Mastercard'),
              value: PaymentMethod.visaMastercard,
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            if (_selectedPaymentMethod == PaymentMethod.mpesa)
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  setState(() {
                    _phoneNumber = value;
                  });
                },
              ),
            if (_selectedPaymentMethod == PaymentMethod.visaMastercard)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Card Number',
                      prefixIcon: Icon(Icons.credit_card),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _cardNumber = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Expiry Date',
                      prefixIcon: Icon(Icons.date_range),
                    ),
                    keyboardType: TextInputType.datetime,
                    onChanged: (value) {
                      setState(() {
                        _expiryDate = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'CVV',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _cvv = value;
                      });
                    },
                  ),
                ],
              ),
            const SizedBox(height: 16),
           ElevatedButton(
              onPressed: () {
                if (_selectedPaymentMethod == null) {
                  _showSnackbar('Please select a payment method');
                } else {
                  print('Processing Payment...');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSuccessScreen(),
                    ),
                  );

                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReceiptPage(
                          discountName: 'Awesome Discount',
                          amountPaid: 100,
                          payerName: 'John Doe',
                          dateTime: DateTime.now(),
                        ),
                      ),
                    );

                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Pay Now',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

enum PaymentMethod {
  mpesa,
  visaMastercard,
}
