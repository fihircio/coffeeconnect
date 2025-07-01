import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CustomizeMenuItemScreen extends StatefulWidget {
  final String imagePath;
  final String name;
  final String price;

  const CustomizeMenuItemScreen({
    required this.imagePath,
    required this.name,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomizeMenuItemScreen> createState() => _CustomizeMenuItemScreenState();
}

class _CustomizeMenuItemScreenState extends State<CustomizeMenuItemScreen> {
  String selectedSize = 'Regular';
  String selectedSugar = 'Normal';
  String selectedMilk = 'Whole';
  List<String> selectedAddOns = [];
  int quantity = 1;

  final List<String> sizes = ['Small', 'Regular', 'Large'];
  final List<String> sugars = ['No Sugar', 'Less', 'Normal', 'Extra'];
  final List<String> milks = ['Whole', 'Skim', 'Oat', 'Soy'];
  final List<String> addOns = ['Extra Shot', 'Whipped Cream', 'Caramel Drizzle'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customize')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(widget.imagePath, width: 100, height: 100, fit: BoxFit.cover),
                  const SizedBox(height: 12),
                  Text(widget.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(widget.price, style: TextStyle(fontSize: 18, color: Color(0xFF6F4E37))),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('Size', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 10,
              children: sizes.map((size) => ChoiceChip(
                label: Text(size),
                selected: selectedSize == size,
                onSelected: (_) => setState(() => selectedSize = size),
              )).toList(),
            ),
            const SizedBox(height: 20),
            Text('Sugar', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 10,
              children: sugars.map((sugar) => ChoiceChip(
                label: Text(sugar),
                selected: selectedSugar == sugar,
                onSelected: (_) => setState(() => selectedSugar = sugar),
              )).toList(),
            ),
            const SizedBox(height: 20),
            Text('Milk', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 10,
              children: milks.map((milk) => ChoiceChip(
                label: Text(milk),
                selected: selectedMilk == milk,
                onSelected: (_) => setState(() => selectedMilk = milk),
              )).toList(),
            ),
            const SizedBox(height: 20),
            Text('Add-ons', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 10,
              children: addOns.map((addOn) => FilterChip(
                label: Text(addOn),
                selected: selectedAddOns.contains(addOn),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedAddOns.add(addOn);
                    } else {
                      selectedAddOns.remove(addOn);
                    }
                  });
                },
              )).toList(),
            ),
            const SizedBox(height: 20),
            Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: quantity > 1 ? () => setState(() => quantity--) : null,
                ),
                Text('$quantity', style: TextStyle(fontSize: 18)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => setState(() => quantity++),
                ),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
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
              final options = '${selectedSize}, ${selectedSugar} Sugar, ${selectedMilk} Milk' +
                  (selectedAddOns.isNotEmpty ? ', ' + selectedAddOns.join(', ') : '');
              final price = double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
              Provider.of<CartProvider>(context, listen: false).addItem(
                CartItem(
                  imagePath: widget.imagePath,
                  name: widget.name,
                  options: options,
                  price: price,
                  qty: quantity,
                ),
              );
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Added to cart!')),
              );
            },
            child: const Text('Add to Cart', style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
} 