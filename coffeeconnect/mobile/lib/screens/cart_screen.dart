import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/merchant_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: cart.items.isEmpty
          ? Center(child: Text('Your cart is empty.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: Image.asset(item.imagePath, width: 48, height: 48, fit: BoxFit.cover),
                    title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(item.options),
                    trailing: SizedBox(
                      height: 48,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('RM${item.price}', style: TextStyle(color: Color(0xFF6F4E37), fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: item.qty > 1
                                      ? () => cart.updateQty(item, item.qty - 1)
                                      : null,
                                ),
                                Text('${item.qty}', style: TextStyle(fontSize: 16)),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () => cart.updateQty(item, item.qty + 1),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                cart.removeItem(item);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Item removed from cart.')),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('RM${cart.total.toStringAsFixed(2)}', style: TextStyle(fontSize: 18, color: Color(0xFF6F4E37), fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 16),
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
                  onPressed: cart.items.isEmpty
                      ? null
                      : () {
                          final paymentConfig = Provider.of<MerchantProvider>(context, listen: false).merchantConfig?.paymentConfig;
                          // TODO: Use paymentConfig for payment processing
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Checkout coming soon!')),
                          );
                        },
                  child: const Text('Checkout', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 