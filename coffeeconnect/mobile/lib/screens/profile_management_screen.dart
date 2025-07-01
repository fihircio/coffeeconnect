import 'package:flutter/material.dart';
import 'order_history_screen.dart';
import 'package:provider/provider.dart';
import '../providers/merchant_provider.dart';

class ProfileManagementScreen extends StatefulWidget {
  @override
  State<ProfileManagementScreen> createState() => _ProfileManagementScreenState();
}

class _ProfileManagementScreenState extends State<ProfileManagementScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = 'Alex Tan';
  String phone = 'alex.tan@email.com';
  String favoriteDrink = 'Iced Latte';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Management')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Loyalty Status: Gold', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6F4E37))),
              Consumer<MerchantProvider>(
                builder: (context, merchantProvider, _) {
                  final tier = merchantProvider.merchantConfig?.subscriptionTier;
                  return tier != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('Merchant Tier: $tier', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                        )
                      : SizedBox.shrink();
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter your name' : null,
                onSaved: (v) => name = v ?? '',
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: phone,
                decoration: InputDecoration(labelText: 'Phone/Email'),
                validator: (v) => v == null || v.isEmpty ? 'Enter your contact' : null,
                onSaved: (v) => phone = v ?? '',
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: favoriteDrink,
                decoration: InputDecoration(labelText: 'Favorite Drink'),
                onSaved: (v) => favoriteDrink = v ?? '',
              ),
              const SizedBox(height: 32),
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
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Profile updated!')),
                      );
                    }
                  },
                  child: const Text('Save Changes', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => OrderHistoryScreen()),
                  );
                },
                child: Text('View Order History'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 