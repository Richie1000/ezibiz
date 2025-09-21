import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Your Personalised\nSelling Experience',
      'subtitle':
          'This app is designed to give you a smooth, fast, and personalised selling experience.',
      'animation': 'assets/animation/shopping_options.json',
    },
    {
      'title': 'Effortless Selling\n& Social Sharing',
      'subtitle':
          'With intuitive tools, quick checkouts and seamless social media integration, you can easily showcase, sell and share your products with customers.',
      'animation': 'assets/animation/online_delivery.json',
    },
    {
      'title': 'Store & Share\nWith Ease',
      'subtitle':
          'Selling just got easier – share your top products directly to social media and reach more customers effortlessly!',
      'animation': 'assets/animation/shopping_delivery.json',
    },
  ];

  void _onNext() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onGetStarted() {
    context.go('/register');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          page['title']!,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Expanded(
                          child: Lottie.asset(page['animation']!),
                        ),
                        Text(
                          page['subtitle']!,
                          textAlign: TextAlign.justify,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Page Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingData.length,
                (index) => _buildDot(
                  isActive: index == _currentPage,
                  theme: theme,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Next / Get Started button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _currentPage == _onboardingData.length - 1
                      ? _onGetStarted
                      : _onNext,
                  child: Text(
                    _currentPage == _onboardingData.length - 1
                        ? 'Get Started'
                        : 'Next',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildDot({required bool isActive, required ThemeData theme}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive
            ? theme.colorScheme.primary
            : theme.colorScheme.primary.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
    );
  }
}
