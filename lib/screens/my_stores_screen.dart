import 'package:flutter/material.dart';
// import '../widgets/dashboard.dart';
// import '../widgets/dashboard_bottom_navbar.dart';

class MyStoresScreen extends StatefulWidget {
  const MyStoresScreen({super.key});

  @override
  _MyStoresScreenState createState() => _MyStoresScreenState();
}

class _MyStoresScreenState extends State<MyStoresScreen> {
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          "My Stores",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Start by stocking your store with products your customers will love.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 14),
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
                  image: "assets/images/apparel.jpg",
                  title: "King’s Klodeen",
                  type: "Type",
                  description:
                      "Discover the latest trends in fashion at StyleHub. From casual wear to statement pieces, we offer quality clothing for men, women, and kids stylish, affordable, and delivered to your door.",
                  productInfo: "No. of Products",
                ),
                const SizedBox(height: 12),
                _buildStoreCard(
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

          // Add Store button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                child: const Text(
                  "+ Add Store",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar removed
    );
  }

  Widget _buildStoreCard({
    required String image,
    required String title,
    required String type,
    required String description,
    required String productInfo,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
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
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Text(type,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    productInfo,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600),
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
