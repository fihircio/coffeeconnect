import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';
import '../providers/merchant_provider.dart';

class OrderStatusScreen extends StatefulWidget {
  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  bool isLoading = true;
  final List<Map<String, String>> orders = [
    {'name': 'Iced Latte', 'status': 'Ready', 'time': '09:10 AM'},
    {'name': 'Butter Croissant', 'status': 'Preparing', 'time': '09:05 AM'},
    {'name': 'Green Tea', 'status': 'Completed', 'time': 'Yesterday'},
  ];

  IconData _statusIcon(String status) {
    switch (status) {
      case 'Ready':
        return Icons.check_circle;
      case 'Preparing':
        return Icons.hourglass_top;
      case 'Completed':
        return Icons.done_all;
      default:
        return Icons.receipt_long;
    }
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Ready':
        return Color(0xFFB2BFA3);
      case 'Preparing':
        return Color(0xFFFFA15F);
      case 'Completed':
        return Color(0xFF6F4E37);
      default:
        return Colors.grey;
    }
  }

  Widget _buildShimmerCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        title: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 80,
            height: 16,
            color: Colors.white,
          ),
        ),
        subtitle: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 40,
            height: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
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
      body: isLoading
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 3,
              itemBuilder: (context, index) => _buildShimmerCard(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    leading: Icon(_statusIcon(order['status']!), color: _statusColor(order['status']!), size: 32),
                    title: Text(order['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${order['status']} · ${order['time']}'),
                  ),
                ).animate().fadeIn(duration: 400.ms, delay: (index * 100).ms);
              },
            ),
    );
  }
} 