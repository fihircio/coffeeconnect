import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/merchant_provider.dart';

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
    final merchantConfig = Provider.of<MerchantProvider>(context).merchantConfig;
    if (merchantConfig == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(merchantConfig.logoUrl),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(width: 12),
            Text(merchantConfig.merchantName),
          ],
        ),
      ),
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
                  Text('RM${order['total']}', style: TextStyle(color: merchantConfig.primaryColor, fontWeight: FontWeight.bold)),
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