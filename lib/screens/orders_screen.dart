import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Order',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.deepPurple,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: Colors.deepPurple,
            tabs: [
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

  Color getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange.shade100;
      case 'Delivered':
        return Colors.green.shade100;
      case 'Cancelled':
        return Colors.red.shade100;
      default:
        return Colors.grey.shade300;
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'Delivered':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  Widget _tag(String text, {Color? color, Color? textColor}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color ?? Colors.grey.shade300,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 10, color: textColor ?? Colors.black),
    ),
  );
}


  @override
Widget build(BuildContext context) {
  return Container(
    width: maxWidth ?? double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade100,
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],
    ),
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  order['orderId'],
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey.shade600),
                    const SizedBox(width: 4),
                    Text(order['timeAgo'], style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: getStatusColor(order['status']),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        order['status'],
                        style: TextStyle(
                          fontSize: 10,
                          color: getStatusTextColor(order['status']),
                        ),
                      ),
                    ),
                    _tag(order['user']),
                    _tag(order['location'],
                        color: Colors.purple.shade100, textColor: Colors.purple),
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              const Icon(Icons.more_vert, size: 18),
            ],
          ),
        ],
      ),
    ),
  );
}

}
