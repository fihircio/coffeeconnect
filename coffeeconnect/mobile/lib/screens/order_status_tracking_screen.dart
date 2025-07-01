import 'package:flutter/material.dart';
import 'dart:async';

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
    return Scaffold(
      appBar: AppBar(title: Text('Order Status')),
      body: Stepper(
        currentStep: _currentStep,
        steps: _steps.map((step) => Step(title: Text(step), content: SizedBox.shrink())).toList(),
        controlsBuilder: (context, details) => SizedBox.shrink(),
      ),
    );
  }
} 