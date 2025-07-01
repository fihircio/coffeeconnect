import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String name;
  final String phone;

  const OrderConfirmationScreen({required this.name, required this.phone, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Confirmed')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Color(0xFF6F4E37), size: 80),
              const SizedBox(height: 24),
              Text('Thank you, $name!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Text('Your order has been placed.', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 24),
              Text('We will contact you at:', style: TextStyle(color: Colors.grey)),
              Text(phone, style: TextStyle(fontSize: 18, color: Color(0xFF6F4E37))),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6F4E37),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text('Return to Home', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 