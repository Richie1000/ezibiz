import 'package:flutter/material.dart';
import '../widgets/side_menu.dart';
import '../theme/theme.dart'; // <-- your AppColors and theme setup

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: const SideMenu(),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Gradient header
          Container(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary300, AppColors.primary300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Wallet',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Payment Method',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_balance_wallet_outlined, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Available Balance',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Icon(Icons.visibility, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  '₵2,586',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Action buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Withdraw'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Transfer'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Transaction card
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Transaction History',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _TransactionItem(name: 'Adepa', amount: '+ ₵302', amountColor: AppColors.primary),
                          _TransactionItem(name: 'Withdrawal', amount: '- ₵30', amountColor: Colors.orange),
                          _TransactionItem(name: 'Emmanuella', amount: '+ ₵902', amountColor: AppColors.primary),
                          _TransactionItem(
                            name: 'Transfer',
                            amount: '+ ₵302',
                            amountColor: Colors.red,
                            note: '(Cancelled)',
                            noteColor: Colors.red,
                          ),
                          _TransactionItem(name: 'Luke', amount: '+ ₵302', amountColor: AppColors.primary),
                          _TransactionItem(name: 'John', amount: '+ ₵302', amountColor: AppColors.primary),
                          _TransactionItem(name: 'Mark', amount: '+ ₵302', amountColor: AppColors.primary),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String name;
  final String amount;
  final Color amountColor;
  final String? note;
  final Color? noteColor;

  const _TransactionItem({
    required this.name,
    required this.amount,
    required this.amountColor,
    this.note,
    this.noteColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 20,
      ),
      title: Row(
        children: [
          Text(name),
          if (note != null) ...[
            const SizedBox(width: 4),
            Text(
              note!,
              style: TextStyle(fontSize: 12, color: noteColor ?? Colors.grey),
            )
          ],
        ],
      ),
      subtitle: const Text('1 May at 9:15'),
      trailing: Text(
        amount,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: amountColor,
        ),
      ),
    );
  }
}
