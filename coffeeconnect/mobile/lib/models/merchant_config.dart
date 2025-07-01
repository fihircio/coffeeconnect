import 'package:flutter/material.dart';

class MerchantConfig {
  final String merchantId;
  final String merchantName;
  final String logoUrl;
  final Color primaryColor;
  final Color secondaryColor;
  final List<MenuCategory> menu;
  final LoyaltyRules loyaltyRules;
  final PaymentConfig paymentConfig;
  final String subscriptionTier;

  MerchantConfig({
    required this.merchantId,
    required this.merchantName,
    required this.logoUrl,
    required this.primaryColor,
    required this.secondaryColor,
    required this.menu,
    required this.loyaltyRules,
    required this.paymentConfig,
    required this.subscriptionTier,
  });

  factory MerchantConfig.fromJson(Map<String, dynamic> json) {
    return MerchantConfig(
      merchantId: json['merchantId'],
      merchantName: json['merchantName'],
      logoUrl: json['logoUrl'],
      primaryColor: Color(int.parse(json['primaryColor'])),
      secondaryColor: Color(int.parse(json['secondaryColor'])),
      menu: (json['menu'] as List<dynamic>).map((e) => MenuCategory.fromJson(e)).toList(),
      loyaltyRules: LoyaltyRules.fromJson(json['loyaltyRules']),
      paymentConfig: PaymentConfig.fromJson(json['paymentConfig']),
      subscriptionTier: json['subscriptionTier'],
    );
  }
}

class MenuCategory {
  final String name;
  final List<MenuItem> items;

  MenuCategory({required this.name, required this.items});

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    return MenuCategory(
      name: json['name'],
      items: (json['items'] as List<dynamic>).map((e) => MenuItem.fromJson(e)).toList(),
    );
  }
}

class MenuItem {
  final String name;
  final String imageUrl;
  final double price;
  final List<String> modifiers;

  MenuItem({required this.name, required this.imageUrl, required this.price, required this.modifiers});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      modifiers: List<String>.from(json['modifiers'] ?? []),
    );
  }
}

class LoyaltyRules {
  final String type; // e.g. 'points', 'stamp_card'
  final double pointsPerCurrency;
  final int stampsRequired;

  LoyaltyRules({required this.type, required this.pointsPerCurrency, required this.stampsRequired});

  factory LoyaltyRules.fromJson(Map<String, dynamic> json) {
    return LoyaltyRules(
      type: json['type'],
      pointsPerCurrency: (json['pointsPerCurrency'] ?? 0).toDouble(),
      stampsRequired: json['stampsRequired'] ?? 0,
    );
  }
}

class PaymentConfig {
  final String gateway;
  final String publicKey;
  final String secretKey;

  PaymentConfig({required this.gateway, required this.publicKey, required this.secretKey});

  factory PaymentConfig.fromJson(Map<String, dynamic> json) {
    return PaymentConfig(
      gateway: json['gateway'],
      publicKey: json['publicKey'],
      secretKey: json['secretKey'],
    );
  }
} 