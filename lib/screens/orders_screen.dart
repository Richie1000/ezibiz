import 'package:flutter/material.dart';
import '../widgets/side_menu.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const SideMenu(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: theme.colorScheme.onSurface),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: Text(
            'Orders',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: const [
              Tab(text: 'All Orders'),
              Tab(text: 'Pending'),
              Tab(text: 'Delivered'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OrderList(statusFilter: null),
            OrderList(statusFilter: 'Pending'),
            OrderList(statusFilter: 'Delivered'),
            OrderList(statusFilter: 'Cancelled'),
          ],
        ),
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  final String? statusFilter;

  const OrderList({super.key, this.statusFilter});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orders = [
      {
        'productName': 'Product Name',
        'orderId': '#000ajsjsnsnajs',
        'price': '230.00',
        'timeAgo': '2m ago',
        'status': 'Pending',
        'user': 'Theophilus',
        'location': 'Adenta 28 ST.',
        'image': 'assets/images/shirt.jpg'
      },
      {
        'productName': 'Product Name',
        'orderId': '#000ajsjsnsnajs',
        'price': '230.00',
        'timeAgo': '2m ago',
        'status': 'Delivered',
        'user': 'Theophilus',
        'location': 'Adenta 28 ST.',
        'image': 'assets/images/shirt.jpg'
      },
      {
        'productName': 'Product Name',
        'orderId': '#000ajsjsnsnajs',
        'price': '230.00',
        'timeAgo': '2m ago',
        'status': 'Cancelled',
        'user': 'Theophilus',
        'location': 'Adenta 28 ST.',
        'image': 'assets/images/shirt.jpg'
      },
    ];

    final filtered = statusFilter == null
        ? orders
        : orders.where((order) => order['status'] == statusFilter).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: filtered.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return OrderCard(order: filtered[index], maxWidth: constraints.maxWidth);
          },
        );
      },
    );
  }
}

class OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final double? maxWidth;

  const OrderCard({super.key, required this.order, this.maxWidth});

  Color _statusBg(BuildContext context, String status) {
    final theme = Theme.of(context);
    switch (status) {
      case 'Pending':
        return theme.colorScheme.tertiaryContainer;
      case 'Delivered':
        return theme.colorScheme.secondaryContainer;
      case 'Cancelled':
        return theme.colorScheme.errorContainer;
      default:
        return theme.colorScheme.surfaceVariant;
    }
  }

  Color _statusText(BuildContext context, String status) {
    final theme = Theme.of(context);
    switch (status) {
      case 'Pending':
        return theme.colorScheme.tertiary;
      case 'Delivered':
        return theme.colorScheme.secondary;
      case 'Cancelled':
        return theme.colorScheme.error;
      default:
        return theme.colorScheme.onSurface;
    }
  }

  Widget _tag(BuildContext context, String text,
      {Color? color, Color? textColor}) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color ?? theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: textColor ?? theme.colorScheme.onSurface,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                order['image'],
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order['productName'],
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    order['orderId'],
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time,
                          size: 14, color: theme.colorScheme.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Text(order['timeAgo'],
                          style: theme.textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      _tag(
                        context,
                        order['status'],
                        color: _statusBg(context, order['status']),
                        textColor: _statusText(context, order['status']),
                      ),
                      _tag(context, order['user']),
                      _tag(
                        context,
                        order['location'],
                        color: theme.colorScheme.primaryContainer,
                        textColor: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "₵${order['price']}",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Icon(Icons.more_vert,
                    size: 18, color: theme.colorScheme.onSurfaceVariant),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
