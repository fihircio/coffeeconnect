import 'package:flutter/material.dart';
import '../models/merchant_config.dart';

class MerchantProvider extends ChangeNotifier {
  MerchantConfig? _merchantConfig;

  MerchantConfig? get merchantConfig => _merchantConfig;

  void setMerchantConfig(MerchantConfig config) {
    _merchantConfig = config;
    notifyListeners();
  }

  void clearMerchantConfig() {
    _merchantConfig = null;
    notifyListeners();
  }
} 