import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/theme.dart'; // adjust if needed

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: Text(
          "Product Details",
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
        centerTitle: true,
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
                children: [
                  Expanded(
                    child: Text(
                      "Productname",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "€10.00",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),

              const Divider(),
              const SizedBox(height: 12),

              // Description
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: theme.textTheme.labelSmall,
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "See More",
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Delivery Details",
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Logistics Partner
              _buildDeliveryTile(
                context,
                title: "Logistics Partner",
                trailing: Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/yango.png", height: 16, width: 16),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          "Yango",
                          style: theme.textTheme.labelSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Change",
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Delivery Cost
              _buildDeliveryTile(
                context,
                title: "Delivery Cost",
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.info_outline,
                        size: 16, color: theme.colorScheme.primary),
                    const SizedBox(width: 8),
                    Text(
                      "₵20.00 - ₵50.00",
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _buildSimpleTile(context, "Manage Stock", onTap: () {}),
              const Divider(height: 1),
              _buildSimpleTile(context, "Reviews", onTap: () {}),
              const Divider(height: 24),

              // Share Section
              Center(
                child: Column(
                  children: [
                    Text(
                      "Share Product via",
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      alignment: WrapAlignment.center,
                      children: const [
                        _ShareButton(icon: Icons.share, color: AppColors.primary),
                        _ShareButton(icon: Icons.facebook, color: Colors.blue),
                        _ShareButton(icon: Icons.camera_alt, color: Colors.purple),
                        _ShareButton(icon: Icons.alternate_email, color: Colors.black),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Icon(Icons.qr_code,
                        size: 56, color: theme.colorScheme.onSurface),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryTile(BuildContext context,
      {required String title, required Widget trailing}) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  Widget _buildSimpleTile(BuildContext context, String title,
      {VoidCallback? onTap}) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(
        title,
        style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.chevron_right, color: theme.iconTheme.color),
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
