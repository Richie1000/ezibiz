import 'package:flutter/material.dart';
import '../theme/theme.dart'; // adjust import to where your theme/colors live

class MyStoresScreen extends StatefulWidget {
  const MyStoresScreen({super.key});

  @override
  _MyStoresScreenState createState() => _MyStoresScreenState();
}

class _MyStoresScreenState extends State<MyStoresScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("My Stores"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Start by stocking your store with products your customers will love.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Store list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildStoreCard(
                  context,
                  image: "assets/images/apparel.jpg",
                  title: "King’s Klodeen",
                  type: "Type",
                  description:
                      "Discover the latest trends in fashion at StyleHub. From casual wear to statement pieces, we offer quality clothing for men, women, and kids stylish, affordable, and delivered to your door.",
                  productInfo: "No. of Products",
                ),
                const SizedBox(height: 12),
                _buildStoreCard(
                  context,
                  image: "assets/images/apparel.jpg",
                  title: "Sneakers God",
                  type: "Sneakers",
                  description:
                      "Step up your style with KickZone — your go-to shop for the latest sneakers. From classic kicks to limited-edition drops, we’ve got something for every sneaker-head.",
                  productInfo: "7 products in stock",
                ),
              ],
            ),
          ),

          // Add Store button (uses theme button style)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("+ Add Store"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreCard(
    BuildContext context, {
    required String image,
    required String title,
    required String type,
    required String description,
    required String productInfo,
  }) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      // cardTheme handles color automatically for light/dark
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Text(
                    type,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    productInfo,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
