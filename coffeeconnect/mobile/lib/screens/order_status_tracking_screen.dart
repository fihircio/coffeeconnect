import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import '../providers/merchant_provider.dart';

class OrderStatusTrackingScreen extends StatefulWidget {
  @override
  State<OrderStatusTrackingScreen> createState() => _OrderStatusTrackingScreenState();
}

class _OrderStatusTrackingScreenState extends State<OrderStatusTrackingScreen> {
  int _currentStep = 0;
  final List<String> _steps = ['Preparing', 'Ready', 'Completed'];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentStep < _steps.length - 1) {
        setState(() => _currentStep++);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
      body: Stepper(
        currentStep: _currentStep,
        steps: _steps.map((step) => Step(title: Text(step), content: SizedBox.shrink())).toList(),
        controlsBuilder: (context, details) => SizedBox.shrink(),
      ),
    );
  }
} 