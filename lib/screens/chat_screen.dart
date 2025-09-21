import 'package:flutter/material.dart';
import '../widgets/side_menu.dart';
import '../theme/theme.dart'; 

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {
        'name': 'Theophilus',
        'message': 'Do you have a different colour?',
        'time': '02:49',
        'avatar': 'https://i.pravatar.cc/150?img=1',
      },
      {
        'name': 'Martin',
        'message': 'Okay',
        'time': '03:42',
        'avatar': 'https://i.pravatar.cc/150?img=2',
      },
      {
        'name': 'Jane Cooper',
        'message': 'Can we negotiate on the price?',
        'time': '22:03',
        'avatar': 'https://i.pravatar.cc/150?img=3',
      },
      {
        'name': 'John Doe',
        'message': 'Can we negotiate on the price?',
        'time': 'Friday',
        'avatar': 'https://i.pravatar.cc/150?img=4',
      },
      {
        'name': 'Arlene McCoy',
        'message': 'Can we negotiate on the price?',
        'time': 'Thursday',
        'avatar': 'https://i.pravatar.cc/150?img=5',
      },
    ];

    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Chats',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: AppColors.textPrimary),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          // 🔍 Search Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.background.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: AppColors.iconGrey),
                  hintText: 'Search',
                  hintStyle: Theme.of(context)
                      .inputDecorationTheme
                      .hintStyle
                      ?.copyWith(color: AppColors.textSecondary),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          // 💬 Chats list
          Expanded(
            child: ListView.separated(
              itemCount: chats.length,
              separatorBuilder: (_, __) => Divider(
                indent: 72,
                endIndent: 16,
                color: AppColors.iconGrey.withOpacity(0.3),
              ),
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(chat['avatar']!),
                  ),
                  title: Text(
                    chat['name']!,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                  ),
                  subtitle: Text(
                    chat['message']!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  trailing: Text(
                    chat['time']!,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
