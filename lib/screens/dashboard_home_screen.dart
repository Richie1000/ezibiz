import 'package:flutter/material.dart';

class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome Kingsley,", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          _buildStoreSelector(),
          const SizedBox(height: 12),
          _buildStoreUrlRow(),
          const SizedBox(height: 16),
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildStatCards(),
          const SizedBox(height: 24),
          _buildSectionHeader("Top Selling Products"),
          const SizedBox(height: 12),
          _buildTopSellingProducts(context),
          const SizedBox(height: 24),
          _buildSectionHeader("Recent Activity"),
          const SizedBox(height: 12),
          _buildRecentActivities(),
        ],
      ),
    );
  }

  Widget _buildStoreSelector() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Select your Store",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: ["Store A", "Store B"]
          .map((store) => DropdownMenuItem(value: store, child: Text(store)))
          .toList(),
      onChanged: (value) {},
    );
  }

  Widget _buildStoreUrlRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text("https://www.ezibiz.com/storename"),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.share),
          label: const Text("Share"),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "T-Shirt",
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {},
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildStatCards() {
    final stats = [
      {"icon": Icons.shopping_bag_outlined, "label": "New Orders", "value": "5"},
      {"icon": Icons.account_balance_wallet_outlined, "label": "Total Revenue", "value": "₵2,586"},
      {"icon": Icons.inventory_2_outlined, "label": "Products in stock", "value": "35"},
      {"icon": Icons.show_chart, "label": "Sales", "value": ""},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: stats.map((stat) {
        return Expanded(
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Icon(stat["icon"] as IconData, color: Colors.deepPurple),
                  const SizedBox(height: 8),
                  Text(stat["value"]!.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(stat["label"]!.toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTopSellingProducts(BuildContext context) {
    final products = [
      {"image": "assets/images/shirt.jpg", "title": "Productname", "price": "€10.00"},
      {"image": "assets/images/short.jpg", "title": "Productname", "price": "€10.00"},
      {"image": "assets/images/shirt.jpg", "title": "Productname", "price": "€10.00"},
      {"image": "assets/images/short.jpg", "title": "Productname", "price": "€10.00"},
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.42,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      p["image"]!,
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      p["title"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Timeless style, durable cotton.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("★★★★★", style: TextStyle(fontSize: 12, color: Colors.amber)),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, size: 16)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(width: 12),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        TextButton(onPressed: () {}, child: const Text("See all")),
      ],
    );
  }

  Widget _buildRecentActivities() {
    final activities = [
      {"icon": Icons.shopping_cart, "title": "New Orders", "time": "2m ago", "amount": "₵230.00"},
      {"icon": Icons.attach_money, "title": "Transaction", "time": "8hrs ago", "amount": "₵685.00"},
      {"icon": Icons.money_off_csred, "title": "Withdrawal", "time": "1hr ago", "amount": "₵2,130.00"},
    ];

    return Column(
      children: activities.map((activity) {
        return Card(
          child: ListTile(
            leading: Icon(activity["icon"] as IconData),
            title: Text(activity["title"]!.toString()),
            subtitle: Text(activity["time"]!.toString()),
            trailing: Text(activity["amount"]!.toString()),
          ),
        );
      }).toList(),
    );
  }
}
