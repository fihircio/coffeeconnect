import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'order_confirmation_screen.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String phone = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: cart.items.isEmpty
          ? Center(child: Text('Your cart is empty.'))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Summary', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ...cart.items.map((item) => ListTile(
                        leading: Image.asset(item.imagePath, width: 40, height: 40, fit: BoxFit.cover),
                        title: Text(item.name),
                        subtitle: Text('${item.options} x${item.qty}'),
                        trailing: Text('RM${(item.price * item.qty).toStringAsFixed(2)}'),
                      )),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('RM${cart.total.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6F4E37))),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text('Your Info', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Name'),
                          validator: (v) => v == null || v.isEmpty ? 'Enter your name' : null,
                          onSaved: (v) => name = v ?? '',
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Phone'),
                          keyboardType: TextInputType.phone,
                          validator: (v) => v == null || v.isEmpty ? 'Enter your phone' : null,
                          onSaved: (v) => phone = v ?? '',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(
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
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                _formKey.currentState?.save();
                                setState(() => isLoading = true);
                                await Future.delayed(Duration(seconds: 2));
                                setState(() => isLoading = false);
                                cart.clear();
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) => OrderConfirmationScreen(name: name, phone: phone),
                                  ),
                                );
                              }
                            },
                            child: const Text('Pay Now', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                ],
              ),
            ),
    );
  }
} 