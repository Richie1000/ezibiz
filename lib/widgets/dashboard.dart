import 'package:ezibiz/screens/chat_screen.dart';
import 'package:ezibiz/screens/orders_screen.dart';
import 'package:ezibiz/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import '../screens/dashboard_home_screen.dart';
import '../screens/products_screen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardHome(),
    const ProductsScreen(),
    const OrdersScreen(), 
    const ChatScreen(), 
    const WalletScreen(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ? _buildAppBar() : null,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: 'Product'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const Icon(Icons.menu),
          const Spacer(),
          Image.asset('assets/icons/ezibiz_logo.png', height: 32),
          const Spacer(),
          const Icon(Icons.notifications_none),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
