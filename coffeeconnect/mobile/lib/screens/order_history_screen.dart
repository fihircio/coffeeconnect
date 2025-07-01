import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      'date': '2024-07-01',
      'items': 'Iced Latte x1, Butter Croissant x2',
      'total': 26.0,
    },
    {
      'date': '2024-06-28',
      'items': 'Green Tea x1',
      'total': 10.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order History')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text('Date: ${order['date']}'),
              subtitle: Text(order['items']),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('RM${order['total']}', style: TextStyle(color: Color(0xFF6F4E37), fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Re-order coming soon!')),
                      );
                    },
                    child: Text('Re-order'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
} 