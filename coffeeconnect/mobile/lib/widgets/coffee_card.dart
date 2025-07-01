import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CoffeeCard extends StatefulWidget {
  final String imagePath;
  final String name;
  final String price;
  final VoidCallback onCustomize;
  final VoidCallback? onTap;

  const CoffeeCard({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.onCustomize,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  double _elevation = 1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: widget.onTap,
      onHighlightChanged: (isPressed) {
        setState(() {
          _elevation = isPressed ? 8 : 1;
        });
      },
      child: Card(
        elevation: _elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.only(bottom: 16),
        child: ListTile(
          leading: Image.asset(widget.imagePath, width: 48, height: 48, fit: BoxFit.cover),
          title: Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(widget.price),
          trailing: Animate(
            effects: [ScaleEffect(duration: 100.ms)],
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFA15F),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: widget.onCustomize,
              child: Text('Customize'),
            ),
          ),
        ),
      ),
    );
  }
} 