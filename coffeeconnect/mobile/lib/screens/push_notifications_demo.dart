import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/merchant_provider.dart';

class PushNotificationsDemo extends StatelessWidget {
  void _showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showNotification(context, 'Your order is ready for pickup!'),
              child: Text('Simulate Order Status Notification'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _showNotification(context, 'Promo: Get 2x points this week!'),
              child: Text('Simulate Promo Notification'),
            ),
          ],
        ),
      ),
    );
  }
} 