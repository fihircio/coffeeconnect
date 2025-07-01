import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/order_status_screen.dart';
import 'screens/loyalty_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/cart_screen.dart';
import 'providers/cart_provider.dart';
import 'screens/order_status_tracking_screen.dart';
import 'screens/order_history_screen.dart';
import 'screens/loyalty_rewards_screen.dart';
import 'screens/push_notifications_demo.dart';
import 'screens/profile_management_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: CoffeeConnectApp(),
    ),
  );
}

class CoffeeConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoffeeConnect',
      theme: AppTheme.lightTheme,
      home: SplashScreen(), // Start with SplashScreen
    );
  }
}

// After login, navigate to MainNavigation
class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  static final List<Widget> _screens = [
    HomeScreen(),
    MenuScreen(),
    OrderStatusScreen(),
    LoyaltyScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _goToCart() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(['Home', 'Menu', 'Orders', 'Loyalty', 'Profile'][_selectedIndex]),
        actions: _selectedIndex != 5 // Only show cart icon if not on CartScreen
            ? [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: _goToCart,
                ),
              ]
            : null,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.local_cafe), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Loyalty'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Manage Profile'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => ProfileManagementScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Order History'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => OrderHistoryScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.track_changes),
            title: Text('Order Status Tracking'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => OrderStatusTrackingScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('Loyalty & Rewards'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => LoyaltyRewardsScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Push Notifications Demo'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => PushNotificationsDemo()),
            ),
          ),
        ],
      ),
    );
  }
}
