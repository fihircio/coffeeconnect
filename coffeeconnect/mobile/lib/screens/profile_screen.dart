import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileScreen extends StatelessWidget {
  final String name = 'Alex Tan';
  final String email = 'alex.tan@email.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Info
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage('lib/assets/images/placeholder_logo.png'),
                    ),
                    const SizedBox(width: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(email, style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(duration: 400.ms),
            const SizedBox(height: 24),
            // Actions
            ...[
              {'icon': Icons.edit, 'label': 'Edit Profile'},
              {'icon': Icons.history, 'label': 'Order History'},
              {'icon': Icons.settings, 'label': 'Settings'},
              {'icon': Icons.logout, 'label': 'Logout'},
            ].asMap().entries.map((entry) {
              int idx = entry.key;
              var action = entry.value;
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  leading: Icon(action['icon'] as IconData, color: Color(0xFF6F4E37)),
                  title: Text(action['label'] as String),
                  onTap: () {},
                ),
              ).animate().fadeIn(duration: 400.ms, delay: (idx * 100).ms);
            }).toList(),
          ],
        ),
      ),
    );
  }
} 