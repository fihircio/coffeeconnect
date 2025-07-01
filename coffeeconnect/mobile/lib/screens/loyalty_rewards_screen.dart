import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/merchant_provider.dart';

class LoyaltyRewardsScreen extends StatelessWidget {
  final int points = 320;
  final List<Map<String, String>> activities = [
    {'desc': 'Order: Iced Latte', 'points': '+12', 'date': 'Today'},
    {'desc': 'Promo: Double Points', 'points': '+24', 'date': 'Yesterday'},
    {'desc': 'Order: Green Tea', 'points': '+10', 'date': 'Yesterday'},
  ];

  @override
  Widget build(BuildContext context) {
    final merchantConfig = Provider.of<MerchantProvider>(context).merchantConfig;
    final loyaltyRules = merchantConfig?.loyaltyRules;

    return Scaffold(
      appBar: AppBar(title: Text('Loyalty & Rewards')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Color(0xFF6F4E37),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Icon(Icons.card_giftcard, color: Colors.white, size: 40),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your Points', style: TextStyle(color: Colors.white70)),
                        Text('$points', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Recent Activity', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...activities.map((activity) => Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    leading: Icon(Icons.star, color: Color(0xFFFFA15F)),
                    title: Text(activity['desc']!),
                    subtitle: Text(activity['date']!),
                    trailing: Text(activity['points']!, style: TextStyle(color: Color(0xFF6F4E37), fontWeight: FontWeight.bold)),
                  ),
                )),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB2BFA3),
                  foregroundColor: Color(0xFF2D2A26),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Redeem coming soon!')),
                  );
                },
                child: const Text('Redeem Points', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 