import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/coffee_card.dart';
import 'customize_menu_item_screen.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isLoading = true;

  final List<String> categories = ['Coffee', 'Tea', 'Snacks'];
  final Map<String, List<Map<String, String>>> menuItems = {
    'Coffee': [
      {'name': 'Iced Latte', 'price': 'RM12', 'image': 'lib/assets/images/placeholder_logo.png'},
      {'name': 'Espresso', 'price': 'RM8', 'image': 'lib/assets/images/placeholder_logo.png'},
    ],
    'Tea': [
      {'name': 'Green Tea', 'price': 'RM10', 'image': 'lib/assets/images/placeholder_logo.png'},
      {'name': 'Chai Latte', 'price': 'RM11', 'image': 'lib/assets/images/placeholder_logo.png'},
    ],
    'Snacks': [
      {'name': 'Butter Croissant', 'price': 'RM7', 'image': 'lib/assets/images/placeholder_logo.png'},
      {'name': 'Banana Bread', 'price': 'RM6', 'image': 'lib/assets/images/placeholder_logo.png'},
    ],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
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
        trailing: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 80,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        bottom: TabBar(
          controller: _tabController,
          tabs: categories.map((cat) => Tab(text: cat)).toList(),
          indicatorColor: Color(0xFF6F4E37),
          labelColor: Color(0xFF6F4E37),
          unselectedLabelColor: Color(0xFFB2BFA3),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: categories.map((cat) {
          if (isLoading) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 3,
              itemBuilder: (context, index) => _buildShimmerCard(),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: menuItems[cat]!.length,
            itemBuilder: (context, index) {
              final item = menuItems[cat]![index];
              return CoffeeCard(
                imagePath: item['image']!,
                name: item['name']!,
                price: item['price']!,
                onCustomize: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CustomizeMenuItemScreen(
                        imagePath: item['image']!,
                        name: item['name']!,
                        price: item['price']!,
                      ),
                    ),
                  );
                },
              ).animate().fadeIn(duration: 400.ms, delay: (index * 100).ms);
            },
          );
        }).toList(),
      ),
    );
  }
} 