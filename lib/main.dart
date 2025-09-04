import 'package:ezibiz/screens/login_screen.dart';
import 'package:ezibiz/screens/menu_dashboard_screen.dart';
import 'package:ezibiz/screens/my_stores_screen.dart';
import 'package:ezibiz/screens/productsdetailscreen.dart';
import 'package:ezibiz/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/onboarding_screen.dart';
import 'screens/register_screen.dart';
import 'widgets/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/product-detail',
          builder: (context, state) => const ProductDetailsScreen(),
        ),
        GoRoute(
          path: '/menu-dashboard',
          builder: (context, state) => const MenuDashboardScreen(),
        ),
        GoRoute(
          path: '/my-stores',
          builder: (context, state) => const MyStoresScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: _router,
      title: 'Ezibiz',
      debugShowCheckedModeBanner: false,
      theme: appTheme
    );
  }
}
