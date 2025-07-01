import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../providers/merchant_provider.dart';

class HomeScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ).animate().fadeIn(duration: 400.ms),
            const SizedBox(height: 20),
            // Nearest Store Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: merchantConfig.secondaryColor,
              child: ListTile(
                leading: Icon(Icons.store, color: merchantConfig.primaryColor),
                title: Text('Bangsar Coffee House', style: TextStyle(color: Color(0xFF2D2A26), fontWeight: FontWeight.bold)),
                subtitle: Text('Open now · 0.5 km', style: TextStyle(color: Color(0xFF2D2A26))),
                trailing: Icon(Icons.arrow_forward_ios, color: merchantConfig.primaryColor),
              ),
            ).animate().fadeIn(duration: 400.ms, delay: 100.ms),
            const SizedBox(height: 20),
            // Quick Reorder
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Color(0xFFFFA15F),
              child: ListTile(
                leading: Icon(Icons.local_cafe, color: Colors.white),
                title: Text('Reorder: Iced Latte', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Text('Last ordered: Mon, 9:00 AM', style: TextStyle(color: Colors.white70)),
                trailing: Icon(Icons.refresh, color: Colors.white),
                onTap: () {},
              ),
            ).animate().fadeIn(duration: 400.ms, delay: 200.ms),
            const SizedBox(height: 20),
            // Promotions Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF6F4E37),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.card_giftcard, color: Colors.white, size: 32),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Get 2x loyalty points on all orders this week!',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 400.ms, delay: 300.ms),
          ],
        ),
      ),
    );
  }
} 