import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text("Product Details", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/images/shirt.jpg",
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 16),

              // Title and Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: Text(
                      "Productname",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "€10.00",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Description
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "See More",
                  style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w500),
                ),
              ),

              const SizedBox(height: 20),

              const Text("Delivery Details", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),

              // Logistics Partner
              _buildDeliveryTile(
                title: "Logistics Partner",
                trailing: Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/yango.png", height: 24),
                      const SizedBox(width: 8),
                      const Flexible(
                        child: Text(
                          "Yango",
                          style: TextStyle(fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: const Text("Change", style: TextStyle(color: Colors.deepPurple)),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Delivery Cost
              _buildDeliveryTile(
                title: "Delivery Cost",
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.info_outline, size: 16, color: Colors.deepPurple),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text("₵20.00 - ₵50.00", style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _buildSimpleTile("Manage Stock", onTap: () {}),
              const Divider(height: 1),
              _buildSimpleTile("Reviews", onTap: () {}),
              const Divider(height: 24),

              // Share Section
              Center(
                child: Column(
                  children: [
                    const Text("Share Product via", style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      alignment: WrapAlignment.center,
                      children: const [
                        _ShareButton(icon: Icons.share, color: Colors.deepPurple),
                        _ShareButton(icon: Icons.facebook, color: Colors.blue),
                        _ShareButton(icon: Icons.camera_alt, color: Colors.purple),
                        _ShareButton(icon: Icons.alternate_email, color: Colors.black),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Icon(Icons.qr_code, size: 56),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryTile({required String title, required Widget trailing}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(color: Colors.grey))),
          trailing,
        ],
      ),
    );
  }

  Widget _buildSimpleTile(String title, {VoidCallback? onTap}) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right),
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
    );
  }
}

class _ShareButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _ShareButton({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: color.withOpacity(0.1),
      child: Icon(icon, color: color, size: 18),
    );
  }
}
