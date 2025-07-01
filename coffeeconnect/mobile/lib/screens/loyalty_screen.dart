import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoyaltyScreen extends StatelessWidget {
  final int points = 320;
  final List<Map<String, String>> activities = [
    {'desc': 'Order: Iced Latte', 'points': '+12', 'date': 'Today'},
    {'desc': 'Promo: Double Points', 'points': '+24', 'date': 'Yesterday'},
    {'desc': 'Order: Green Tea', 'points': '+10', 'date': 'Yesterday'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loyalty')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Points Balance Card
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
            ).animate().fadeIn(duration: 400.ms),
            const SizedBox(height: 24),
            Text('Recent Activity', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...activities.asMap().entries.map((entry) {
              int idx = entry.key;
              var activity = entry.value;
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  leading: Icon(Icons.star, color: Color(0xFFFFA15F)),
                  title: Text(activity['desc']!),
                  subtitle: Text(activity['date']!),
                  trailing: Text(activity['points']!, style: TextStyle(color: Color(0xFF6F4E37), fontWeight: FontWeight.bold)),
                ),
              ).animate().fadeIn(duration: 400.ms, delay: (idx * 100).ms);
            }).toList(),
            const SizedBox(height: 24),
            // Promo Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFB2BFA3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.local_offer, color: Color(0xFF6F4E37), size: 32),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Redeem 100 points for a free drink! 🎉',
                      style: TextStyle(color: Color(0xFF2D2A26), fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 400.ms, delay: 400.ms),
          ],
        ),
      ),
    );
  }
} 