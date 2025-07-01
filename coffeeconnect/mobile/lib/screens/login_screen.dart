import 'package:flutter/material.dart';
import '../main.dart';

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
                onPressed: () {
                  // TODO: Implement OTP logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('OTP sent (mock)')),
                  );
                },
                child: const Text('Send OTP', style: TextStyle(fontSize: 18)),
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
} 