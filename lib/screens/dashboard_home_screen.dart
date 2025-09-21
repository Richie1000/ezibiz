import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome Kingsley,", style: theme.textTheme.titleMedium),
          const SizedBox(height: 5),
          _buildStoreSelector(theme),
          const SizedBox(height: 5),
          _buildStoreUrlRow(theme),
          const SizedBox(height: 5),
          _buildSearchBar(theme),
          const SizedBox(height: 5),
          _buildStatCards(theme),
          const SizedBox(height: 5),
          _buildSectionHeader("Top Selling Products", theme),
          const SizedBox(height: 5),
          _buildTopSellingProducts(context, theme),
          const SizedBox(height: 5),
          _buildSectionHeader("Recent Activity", theme),
          const SizedBox(height: 5),
          _buildRecentActivities(theme),
        ],
      ),
    );
  }

  Widget _buildStoreSelector(ThemeData theme) {
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

  Widget _buildStoreUrlRow(ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: theme.dividerColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "https://www.ezibiz.com/storename",
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.share),
          label: const Text("Share"),
        ),
      ],
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    return TextField(
      decoration: InputDecoration(
        hintText: "T-Shirt",
        hintStyle: theme.textTheme.bodySmall?.copyWith(
          color: theme.hintColor,
          fontSize: 14,
        ),
        prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
        suffixIcon: IconButton(
          icon: Icon(Icons.filter_list, color: theme.iconTheme.color),
          onPressed: () {},
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.dividerColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.dividerColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      ),
    );
  }

  Widget _buildStatCards(ThemeData theme) {
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
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: theme.cardColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Icon(stat["icon"] as IconData, color: theme.colorScheme.primary),
                    const SizedBox(height: 8),
                    Text(
                      stat["value"]!.toString(),
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      stat["label"]!.toString(),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSectionHeader(String title, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "See all",
            style: theme.textTheme.labelLarge?.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildTopSellingProducts(BuildContext context, ThemeData theme) {
    final products = [
      {"image": "assets/images/shirt.jpg", "title": "Productname", "price": "€10.00"},
      {"image": "assets/images/short.jpg", "title": "Productname", "price": "€10.00"},
      {"image": "assets/images/shirt.jpg", "title": "Productname", "price": "€10.00"},
      {"image": "assets/images/short.jpg", "title": "Productname", "price": "€10.00"},
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.42,
            child: GestureDetector(
              onTap: () => context.go('/product-details'),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: theme.cardColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.asset(
                        p["image"]!,
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        p["title"]!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        "Timeless style, durable cotton.",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "★★★★★",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.secondary,
                              fontSize: 12,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert, size: 16),
                            tooltip: 'More',
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(width: 12),
      ),
    );
  }

  Widget _buildRecentActivities(ThemeData theme) {
    final activities = [
      {"icon": Icons.shopping_cart, "title": "New Orders", "time": "2m ago", "amount": "₵230.00"},
      {"icon": Icons.attach_money, "title": "Transaction", "time": "8hrs ago", "amount": "₵685.00"},
      {"icon": Icons.money_off_csred, "title": "Withdrawal", "time": "1hr ago", "amount": "₵2,130.00"},
    ];

    return Card(
      color: theme.cardColor,
      child: Column(
        children: [
          ...activities.asMap().entries.map((entry) {
            final i = entry.key;
            final activity = entry.value;
            return Column(
              children: [
                ListTile(
                  leading: Icon(activity["icon"] as IconData, color: theme.colorScheme.primary),
                  title: Text(
                    activity["title"] as String,
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
                  ),
                  subtitle: Text(
                    activity["time"] as String,
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
                  ),
                  trailing: Text(
                    activity["amount"] as String,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                if (i < activities.length - 1)
                  Divider(height: 1, thickness: 1, color: theme.dividerColor),
              ],
            );
          }),
        ],
      ),
    );
  }
}
