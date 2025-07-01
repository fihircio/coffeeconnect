import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/merchant_provider.dart';
import '../models/merchant_config.dart';
import 'onboarding_screen.dart';
import 'login_screen.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _error = false;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    try {
      // Simulate auth check
      final isAuthenticated = false; // TODO: Replace with real auth check
      if (isAuthenticated) {
        final merchantId = 'demo_merchant_1';
        final merchantConfig = await fetchMerchantConfig(merchantId);
        Provider.of<MerchantProvider>(context, listen: false).setMerchantConfig(merchantConfig);
        if (!mounted) return;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => CoffeeConnectApp()),
          );
        });
      } else {
        if (!mounted) return;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => OnboardingScreen()),
          );
        });
      }
    } catch (e) {
      if (mounted) setState(() => _error = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, color: Colors.red, size: 48),
              SizedBox(height: 16),
              Text('Failed to load merchant config.'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() => _error = false);
                  _initApp();
                },
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
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