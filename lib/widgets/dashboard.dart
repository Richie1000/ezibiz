import 'package:ezibiz/screens/chat_screen.dart';
import 'package:ezibiz/screens/orders_screen.dart';
import 'package:ezibiz/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import '../screens/dashboard_home_screen.dart';
import '../screens/products_screen.dart';
import '../widgets/side_menu.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      drawer: const SideMenu(),
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
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          const Spacer(),
          Image.asset('assets/icons/ezibiz_logo.png', height: 32),
          const Spacer(),
          const Icon(Icons.notifications_none),
        ],
      ),
    );
  }
}
