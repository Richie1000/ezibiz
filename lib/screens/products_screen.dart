import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/side_menu.dart'; // Adjust the import based on your project structure

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/apparel.jpg'),
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

          // Category Tabs
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

          // Product Grid
          Expanded(
  child: GridView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6), // tighter padding
    itemCount: 6,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.72, // a bit taller → narrower card
      crossAxisSpacing: 6,    // reduced spacing
      mainAxisSpacing: 6,
    ),
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          context.push('/product-detail');
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(6.0), // compact padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/shirt.jpg',
                    height: 70,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Productname €10.00",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                const Text(
                  "Timeless style with a comfortable fit.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11),
                ),
                const Spacer(),
                const Text(
                  "★★★★★",
                  style: TextStyle(fontSize: 11, color: Colors.amber),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.share, size: 16),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, size: 16),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
