import 'package:flutter/material.dart';

class MenuDashboardScreen extends StatelessWidget {
  const MenuDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Revenue Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Revenue",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Icon(Icons.remove_red_eye, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "₵2,586",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "+12% from last month",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Stats Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _StatCard(title: "Conversion Rate", value: "94%"),
                _StatCard(title: "Total Orders", value: "49 Total Orders"),
                _StatCard(title: "AVG. Order Value", value: "₵48"),
                _TopProductsCard(),
              ],
            ),
            const SizedBox(height: 24),

            // Sales Chart
            const Text(
              "Sales",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            SimpleBarChart(
              values: [100, 120, 140, 220, 260, 180, 200, 90, 240, 280, 320, 350],
              labels: ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"],
            ),
          ],
        ),
      ),
      // bottomNavigationBar removed
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(color: Colors.black54, fontSize: 14)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _TopProductsCard extends StatelessWidget {
  const _TopProductsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top Selling Products", style: TextStyle(fontSize: 14, color: Colors.black54)),
          SizedBox(height: 8),
          Text("1. Tshirt"),
          Text("2. Green Kaftan"),
          Text("3. Round Neck"),
        ],
      ),
    );
  }
}

// Custom Bar Chart
class SimpleBarChart extends StatelessWidget {
  final List<int> values;
  final List<String> labels;

  const SimpleBarChart({super.key, required this.values, required this.labels});

  @override
  Widget build(BuildContext context) {
    final maxValue = values.reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(values.length, (i) {
          final height = (values[i] / maxValue) * 150; // bar scaling
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: height,
                width: 12,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 4),
              Text(labels[i], style: const TextStyle(fontSize: 10)),
            ],
          );
        }),
      ),
    );
  }
}
