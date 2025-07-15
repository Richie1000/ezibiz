// products_screen.dart
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/apparel.jpg'), // Replace with actual store image
              radius: 16,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("King's Klodeen", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Type", style: TextStyle(fontSize: 12)),
                Text("No. of Products", style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Column(
        children: [
          // Search + Filter Row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Product',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.swap_vert),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: const [
                Text("Products", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Spacer(),
                ElevatedButton(
                  onPressed: null,
                  child: Text('+ Product'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // TabBar substitute
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text("All", style: TextStyle(decoration: TextDecoration.underline)),
                SizedBox(width: 16),
                Text("Newly Added"),
                SizedBox(width: 16),
                Text("Best Seller"),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Products Grid/List
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 270,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/shirt.jpg', height: 120, width: double.infinity, fit: BoxFit.cover),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Productname €10.00", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Timeless style with a comfortable fit. Made from durable cotton...",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("★★★★★", style: TextStyle(fontSize: 12, color: Colors.amber)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          IconButton(icon: Icon(Icons.share, size: 16), onPressed: null),
                          IconButton(icon: Icon(Icons.more_vert, size: 16), onPressed: null),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
