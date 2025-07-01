import 'package:flutter/material.dart';
import '../main.dart';
import 'package:provider/provider.dart';
import '../providers/merchant_provider.dart';
import '../models/merchant_config.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/placeholder_logo.png',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 32),
            const Text(
              'Sign in to CoffeeConnect',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F4E37),
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 24),
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
                onPressed: () async {
                  // Simulate login and merchant_id fetch
                  final merchantId = 'demo_merchant_1';
                  // Simulate fetching merchant config from backend
                  final merchantConfig = await fetchMerchantConfig(merchantId);
                  Provider.of<MerchantProvider>(context, listen: false).setMerchantConfig(merchantConfig);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => CoffeeConnectApp()),
                  );
                },
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => MainNavigation()),
                );
              },
              child: const Text('Skip for now'),
            ),
            const SizedBox(height: 24),
            const Text('or sign in with'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.g_mobiledata, size: 32, color: Color(0xFF6F4E37)),
                  onPressed: () {
                    // TODO: Google sign-in
                  },
                ),
                SizedBox(width: 24),
                IconButton(
                  icon: Icon(Icons.apple, size: 32, color: Color(0xFF6F4E37)),
                  onPressed: () {
                    // TODO: Apple sign-in
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<MerchantConfig> fetchMerchantConfig(String merchantId) async {
    // TODO: Replace with real API call
    await Future.delayed(Duration(seconds: 1));
    return MerchantConfig(
      merchantId: merchantId,
      merchantName: 'Demo Coffee',
      logoUrl: 'https://placehold.co/100x100',
      primaryColor: Color(0xFF6F4E37),
      secondaryColor: Color(0xFFFFA15F),
      menu: [
        MenuCategory(name: 'Coffee', items: [
          MenuItem(name: 'Iced Latte', imageUrl: 'https://placehold.co/48x48', price: 12.0, modifiers: ['Regular', 'Large']),
        ]),
      ],
      loyaltyRules: LoyaltyRules(type: 'points', pointsPerCurrency: 1.0, stampsRequired: 0),
      paymentConfig: PaymentConfig(gateway: 'stripe', publicKey: 'pk_test', secretKey: 'sk_test'),
      subscriptionTier: 'Pro',
    );
  }
} 