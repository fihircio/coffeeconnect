import 'package:flutter/material.dart';

class PushNotificationsDemo extends StatelessWidget {
  void _showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Push Notifications Demo')),
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